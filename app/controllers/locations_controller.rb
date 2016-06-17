class LocationsController < ApplicationController
  before_action :authenticate_merchant!, except: [:show]
  # location_exists is defined in application_controller.rb
  # it checks if a current_merchant already has a location created in the database
  # and disable creation of a new one.
  before_action :location_exists, only: [:new, :create]
  before_action :set_location, only: [:show, :edit, :update, :destroy]


  # GET /locations
  # GET /locations.json
  def index
    @locations = current_merchant.locations
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    #@location = current_merchant.locations.find(params[:id]) rescue redirect_to(root_path)
    
    # below code works only when current_merchant is logged in
    #@products = current_merchant.products
    #@categories = current_merchant.categories

    # this kinda works?
    @categories = @location.categories

    @locations = Location.find(params[:id])
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow "<h4>#{location.name}</h4><p><b>Address:</b> #{location.address}</p><p><b>Phone:</b> #{location.phone}</p>"
      marker.json({
        name:     location.name,
        address: location.address
      })
    end

    # this gives some stupid output that isn't true
    #@products = @categories.product
  end

  # GET /locations/new
  def new
    @location = current_merchant.locations.build
  end

  # GET /locations/1/edit
  def edit
    @location = current_merchant.locations.find(params[:id]) rescue redirect_to(root_path)
  end

  # POST /locations
  # POST /locations.json
  def create

    
      @location = current_merchant.locations.build(location_params)
      respond_to do |format|
        if @location.save
          format.html { redirect_to locations_path, notice: 'Location was successfully created.' }
          format.json { render :show, status: :created, location: @location }
        else
          format.html { render :new }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to locations_path, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :about, :phone, :email, :takeout, :delivery, :address, :category_ids => [])
    end
end
