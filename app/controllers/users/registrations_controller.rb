class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]


  def edit
    # flash[:notice] = params[:new_img_url]
  end

  def update
    current_user.update_attributes(user_params)
    if params[:user][:current_password] && current_user.valid_password?(params[:user][:current_password]) && params[:user][:password] && params[:user][:password_confirmation] && params[:user][:password_confirmation] == params[:user][:password]
      current_user.update_attributes(:password => params[:user][:password])
      current_user.update_attributes(:password_confirmation => params[:user][:password_confirmation])
    #elsif !(params[:user][:current_password].nil?) && (params[:user][:password].nil?) && !(params[:user][:password_confirmation].nil?)
    end
    redirect_to edit_user_registration_path
  end

  #def incorrect_inputs
  #  @update_call = false
  #  return "your input(s) for changing password is(are) invalid"
  #end

  protected
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname, :email, :password])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname])
  end
  
  private
  def user_params
    params.require(:user).permit(:img_url, :blurb, :fname, :lname, :email)
  end
  
end