class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # This method is to check if a location has been created already by the merchant.
  # If a location is present in the db -> don't allow creation of another one.
  # A before_action filter is set in locations_controller.rb
  def location_exists
  	redirect_to('/') if current_merchant.locations.present?
  end

end
