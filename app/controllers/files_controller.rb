class FilesController < ApplicationController
  require 'csv'
  respond_to :html, :xml, :json, :zip

  before_action :authenticate_user!
  authorize_resource

  def index
    @csv_file = CsvFile.new.csv_file
    @csv_file.success_action_redirect = import_files_url
  end

  def changes
    prefix = "changes-#{Time.now.strftime("%Y-%m-%d-%H-%M")}"
    folder_name = "#{Rails.root}/tmp/downloads/#{prefix}"
    zip_file_name = "#{prefix}.zip"
    areas_of_changes = ["Contact", "Message"]

    # Create folder
    FileUtils.mkdir_p("#{Rails.root}/tmp/downloads") unless File.exist?("#{Rails.root}/tmp/downloads")
    FileUtils.mkdir_p(folder_name)

    # Export data
    areas_of_changes.each do |model_name|
      file_name = "#{folder_name}/#{model_name}.csv"
      CSV.open(file_name, "wb", {:force_quotes=>true}) do |csv|
        csv << Module.const_get(model_name).column_names
        # Module.const_get(model_name).changed.each do |row|
        Module.const_get(model_name).to_sync.each do |row|
          csv << Module.const_get(model_name).column_names.map { |col| row[col]}
        end
      end
    end

    # Zip CSV files
    File.delete("#{folder_name}/#{zip_file_name}") if File.exist?("#{folder_name}/#{zip_file_name}")
    Zip::Archive.open("#{folder_name}/#{zip_file_name}", Zip::CREATE) do |ar|
      areas_of_changes.each do |model_name|
        filename = "#{folder_name}/#{model_name}.csv"
        ar.add_file(filename)
      end
    end

    # Send file
    send_file "#{folder_name}/#{zip_file_name}", :type => 'application/zip', :disposition => 'attachment', :filename => zip_file_name

  end


  def import

    # Download and Unzip file from S3

    # case params[:key].split("/").last
    #   when "Activations.csv"
    #     ImportActivationsJob.perform_later(filename: params[:key])
    #     flash[:notice] = "Activations CSV queued for import."
    #   when "Contacts.csv"
    #     ImportContactsJob.perform_later(filename: params[:key])
    #     flash[:notice] = "Contacts CSV queued for import."
    #   when "Fairs.csv"
    #     ImportFairsJob.perform_later(filename: params[:key])
    #     flash[:notice] = "Fairs CSV queued for import."
    #   when "Incidents.csv"
    #     ImportIncidentsJob.perform_later(filename: params[:key])
    #     flash[:notice] = "Incidents CSV queued for import."
    #   when "Serial Numbers.csv"
    #     ImportSerialNumbersJob.perform_later(filename: params[:key])
    #     flash[:notice] = "Serial Numbers CSV queued for import."
    # end

    redirect_to files_path
  end

end
