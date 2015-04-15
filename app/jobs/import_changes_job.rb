class ImportChangesJob < Struct.new(:s3_file_name_with_path)
  require 'csv'
  # queue_as :default

  def perform
    file_name = s3_file_name_with_path.split("/").last

    # Cleanup temp files
    FileUtils.rm_rf("#{Rails.root}/tmp/uploads")
    FileUtils.mkdir_p("#{Rails.root}/tmp/uploads")

    # Download file from S3
    connection = Fog::Storage.new(
      :provider => 'AWS',
      :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    )
    directory = connection.directories.get(ENV['S3_BUCKET'])
    s3_file = directory.files.get(s3_file_name_with_path)
    local_file = "#{Rails.root}/tmp/uploads/#{file_name.split("/").last}"
    File.open(local_file, 'wb') do |file|
      file.write(s3_file.body)
    end

    # Unzip file
    Zip::Archive.open("#{Rails.root}/tmp/uploads/#{file_name}") do |zip|
      zip.each do |zf|
        if File.extname(zf.name) == ".csv" && !/MACOSX/.match(zf.name)
          File.open("#{Rails.root}/tmp/uploads/#{zf.name}", 'wb') do |file|
            file.write(zf.read)
          end
        end
      end
    end

    # Remove existing data
    Fair.delete_all
    Contact.delete_all
    Message.delete_all
    SerialNumber.delete_all
    Activation.delete_all

    # Run jobs in order of relationships
    ImportFairsJob.new.perform if File.exist?("#{Rails.root}/tmp/uploads/Fairs.csv")
    ImportContactsJob.new.perform if File.exist?("#{Rails.root}/tmp/uploads/Contacts.csv")
    ImportMessagesJob.new.perform if File.exist?("#{Rails.root}/tmp/uploads/Incidents.csv")
    ImportSerialNumbersJob.new.perform if File.exist?("#{Rails.root}/tmp/uploads/Serial Numbers.csv")
    ImportActivationsJob.new.perform if File.exist?("#{Rails.root}/tmp/uploads/Activations.csv")
  end

end
