class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #def new
    #@item = Item.new
  #end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :last_name_kana, :first_name, :first_name_kana, :birthday])
  end
end
