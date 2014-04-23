class ContactsController < ApplicationController

  def index
    @contacts = Contact.contacts_for_user_id(params[:user_id])
    render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_message
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: @contact
  end

  def create
    if params[:user_id].nil?
      render text: "Must supply user_id"
    else
      @contact = Contact.new(contact_params)
      if @contact.save
        render json: @contact
      else
        render json: @contact.errors.full_messages
      end
    end
  end

  def favorites
    @favorite_contacts = Contact.favorite_contacts_for_user_id(params[:user_id])
    render json: @favorite_contacts
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id, :favorite)
  end

end