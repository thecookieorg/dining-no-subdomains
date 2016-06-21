class ReportsController < ApplicationController
  def index
  	@locations = current_merchant.locations
  end
end
