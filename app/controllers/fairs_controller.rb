class FairsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  before_action :set_fair, only: [:show, :edit, :update, :destroy]

  # GET /fairs
  # GET /fairs.json
  def index
    @fairs = Fair.all.page(params[:page])
  end

  # GET /fairs/1
  # GET /fairs/1.json
  def show
  end

  # GET /fairs/new
  def new
    @fair = Fair.new
  end

  # GET /fairs/1/edit
  def edit
  end

  # POST /fairs
  # POST /fairs.json
  def create
    @fair = Fair.new(fair_params)

    respond_to do |format|
      if @fair.save
        format.html { redirect_to @fair, notice: 'Fair was successfully created.' }
        format.json { render :show, status: :created, location: @fair }
      else
        format.html { render :new }
        format.json { render json: @fair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fairs/1
  # PATCH/PUT /fairs/1.json
  def update
    respond_to do |format|
      if @fair.update(fair_params)
        format.html { redirect_to @fair, notice: 'Fair was successfully updated.' }
        format.json { render :show, status: :ok, location: @fair }
      else
        format.html { render :edit }
        format.json { render json: @fair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fairs/1
  # DELETE /fairs/1.json
  def destroy
    @fair.destroy
    respond_to do |format|
      format.html { redirect_to fairs_url, notice: 'Fair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def search
    return unless params[:search]

    @fairs = Fair.all
    @contacts = Contact.all
    @query = "#{params[:search]}"
    search = params[:search]

    # Build Search
    if search.blank? && terms.find_index("state") == nil && terms.find_index("fair") == nil
      @fairs = Fair.none
    else
      @fairs = @fairs.where("fair_name ILIKE ?", "%#{search}%")
    end
    @contacts = @contacts.where(" LOWER(contacts.contact_name) ILIKE ? OR " \
                         " regexp_replace(contacts.contact_phone_1, '[^a-zA-Z0-9]+', '', 'g') LIKE ? OR " \
                         " regexp_replace(contacts.contact_phone_1, '[^a-zA-Z0-9]+', '', 'g') LIKE ? OR " \
                         " regexp_replace(contacts.contact_phone_1, '[^a-zA-Z0-9]+', '', 'g') LIKE ?", \
                         "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")

    # Apply sort
    @fairs = @fairs.order("fair_name").limit(25)
    @contacts = @contacts.order("contact_name").limit(25)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fair
      @fair = Fair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fair_params
      params.require(:fair).permit(:fid, :is_fair, :fair_name, :fair_state, :fair_notes, :video_key, :video_key_2009, :video_key_2006, :purchased, :returned_product, :converted_from_competition, :feather_in_hat, :fair_time, :incidents_remaining, :service_plan_number, :old_service_plan_ended, :old_service_plan_number, :international, :showorks_web_user, :temp_flag, :free_upgrade, :poor_payment, :christmas_2010, :christmas_2011, :processed_2012, :mailed_2012_invoice, :courtesy_late_pmt, :bulk_ne, :judas)
    end
end
