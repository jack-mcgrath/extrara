class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user
  def forem_name
      firstname
  end
  rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
end

def redirect_back_or(path)
    redirect_to request.referer || path
end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_parameters, if: :devise_controller?
  protected
  def configure_devise_parameters
      devise_parameter_sanitizer.for(:account_update) << :firstname
      devise_parameter_sanitizer.for(:account_update) << :lastname
      devise_parameter_sanitizer.for(:account_update) << :age
      devise_parameter_sanitizer.for(:account_update) << :Location
      devise_parameter_sanitizer.for(:account_update) << :skills
      devise_parameter_sanitizer.for(:account_update) << :info
      devise_parameter_sanitizer.for(:account_update) << :avatar
      devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname <<:age <<:Location <<:avatar
  end
  private
end
