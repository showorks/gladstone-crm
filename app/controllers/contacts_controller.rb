class ContactsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_operator, only: [:create, :update]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all.page(params[:page])
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:cid, :fid, :contact_name, :contact_address, :contact_city, :contact_state, :contact_zip_code, :contact_country,
                                      :fair_address, :contact_phone_1, :contact_phone_2, :contact_phone_cell, :contact_email,
                                      :contact_date_registered, :contact_last_edited, :contact_date_address_last_active, :contact_last_mailed,
                                      :contact_active, :contact_reputation, :contact_notes, :do_not_mail, :showorks_web_contact, :source, :to_print,
                                      :valid_address, :bad_address, :bulk_mail_2000_cd, :to_terrell, :bulk_mail_2003_cd, :international,
                                      :gift_basket, :brochure_2004_fall, :christmas_card_2004, :temp_flag, :sweb_mailout, :nalsrma,
                                      :filled_out_form_at_2005_rmfa, :christmas_card_2005, :filled_out_form_at_2005_iafe, :followup, :flag,
                                      :excel_workshop_06, :eclassroom_06, :iafe_06, :competitor_booth_06, :date_last_emailed_for_service_reminder,
                                      :do_not_remind_for_service, :state_convention_07, :workshop_07, :christmas_card_07, :christmas_box_07, :beta_tester,
                                      :wyoming_training, :recieved_thank_you_from_christmas_box, :eblast_2012_announce, :christmas_2011, :bulk_ne,
                                      :created_by, :updated_by)
    end
end
