class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]


  def edit
    # flash[:notice] = params[:new_img_url]
  end

  def update
    # puts params
    # puts params
    if current_user.is_core_member
      current_user.update_attributes(update_params)
    end
    #debugger
    if params[:user][:current_password] && current_user.valid_password?(params[:user][:current_password]) && params[:user][:password] && params[:user][:password_confirmation] && params[:user][:password_confirmation] == params[:user][:password]
      current_user.update_attributes(:password => params[:user][:password])
      current_user.update_attributes(:password_confirmation => params[:user][:password_confirmation])
    #elsif !(params[:user][:current_password].nil?) && (params[:user][:password].nil?) && !(params[:user][:password_confirmation].nil?)
    end
    current_user.update_attributes(:fname => params[:user][:fname]) if params[:user][:fname]
    current_user.update_attributes(:lname => params[:user][:lname]) if params[:user][:lname]
    current_user.update_attributes(:email => params[:user][:email]) if params[:user][:email]
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
  def update_params
    permitted = params.require(:user).permit(:img_url, :blurb)
  end
  
end