class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # setting the time zone
  around_action :set_time_zone#, if: :current_merchant

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  private
	  # This method is to check if a location has been created already by the merchant.
	  # If a location is present in the db -> don't allow creation of another one.
	  # A before_action filter is set in locations_controller.rb
	  def location_exists
	  	redirect_to('/') if current_merchant.locations.present?
	  end

	  def check_ownership_before_editing_location
	  	@location = current_merchant.locations.find(params[:id]) rescue redirect_to(root_path)
	  end

	  def set_time_zone(&block)
	  	locations = current_merchant.locations
	  	locations.each do |l|
			Time.use_zone(l.time_zone, &block)
		end
	  end

end
