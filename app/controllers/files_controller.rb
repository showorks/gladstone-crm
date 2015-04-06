class FilesController < ApplicationController

  before_action :authenticate_user!

  def index
    @csv_file = CsvFile.new.csv_file
    @csv_file.success_action_redirect = import_files_url
  end

  def import

    case params[:key].split("/").last
      when "Activations.csv"
        ImportActivationsJob.perform_later(filename: params[:key])
        flash[:notice] = "Activations CSV queued for import."
      when "Contacts.csv"
        ImportContactsJob.perform_later(filename: params[:key])
        flash[:notice] = "Contacts CSV queued for import."
      when "Fairs.csv"
        ImportFairsJob.perform_later(filename: params[:key])
        flash[:notice] = "Fairs CSV queued for import."
      when "Incidents.csv"
        ImportIncidentsJob.perform_later(filename: params[:key])
        flash[:notice] = "Incidents CSV queued for import."
      when "Serial Numbers.csv"
        ImportSerialNumbersJob.perform_later(filename: params[:key])
        flash[:notice] = "Serial Numbers CSV queued for import."
    end

    redirect_to files_path
  end

end
