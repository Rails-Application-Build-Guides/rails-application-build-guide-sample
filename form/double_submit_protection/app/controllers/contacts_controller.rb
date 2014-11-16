class ContactsController < ApplicationController
  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path,
        notice: 'ご意見・ご感想をお寄せいただき、ありがとうございました。'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :content)
  end
end
