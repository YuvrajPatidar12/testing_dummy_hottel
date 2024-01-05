class HomeController < ApplicationController
  # before_action :check_current_user
  layout "home"
  def index
    
  end
  def about

  end
  def home_service
    
  end
  
  def profile
    
  end

  def contact
    @contact = Contact.new
  end

  def process_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to root_path, notice: 'Thank you for contacting us!'
    else
      render :contact
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject ,:message)
  end

  # def check_current_user
  #   if current_user && current_user.admin?
  #     redirect_to admin_dashboard_index_path
  #   elsif current_user && current_user.manager?
  #     redirect_to manager_dashboard_index_path
  #   elsif current_user && current_user.customer?
  #     redirect_to customer_dashboard_index_path
  #   else
  #     redirect_to root_path
  #   end
  # end
end
