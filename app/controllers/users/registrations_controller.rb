class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def edit
    # flash[:notice] = params[:new_img_url]
  end
  
  def update
    current_user.update_attributes(:img_url => params[:user][:img_url]) if params[:user][:img_url]
    redirect_to edit_user_registration_path
  end
  
  protected
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname, :email, :password])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname])
  end
end
