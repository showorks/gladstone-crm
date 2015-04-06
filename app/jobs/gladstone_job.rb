class GladstoneJob < ActiveJob::Base

  private

    def get_file_from_s3(filename)
      connection = Fog::Storage.new(
        :provider => 'AWS',
        :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      )
      directory = connection.directories.get(ENV['S3_BUCKET'])
      s3_file = directory.files.get(filename)
      local_file = "#{Rails.root}/tmp/uploads/#{filename.split("/").last}"
      File.open(local_file, 'wb') do |file|
        file.write(s3_file.body)
      end
    end

    def gs_convert_boolean(value=nil)
      if value.present? && value == "TRUE"
        return true
      else
        return false
      end
    end

    def gs_convert_date(value=nil)
      if value.present?
        return DateTime.strptime(value, '%m/%d/%Y %H:%M:%S')
      else
        return nil
      end
    end

end
