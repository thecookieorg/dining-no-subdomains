class LocationHoursController < ApplicationController
  before_action :authenticate_merchant!
  before_action :set_location_hour, only: [:show, :edit, :update, :destroy]

  # GET /location_hours
  # GET /location_hours.json
  def index
    @location_hours = current_merchant.location_hours
  end

  # GET /location_hours/1
  # GET /location_hours/1.json
  def show
  end

  # GET /location_hours/new
  def new
    @location_hour = current_merchant.location_hours.build
    @location_hour.hours.build
  end

  # GET /location_hours/1/edit
  def edit
  end

  # POST /location_hours
  # POST /location_hours.json
  def create
    @location_hour = current_merchant.location_hours.build(location_hour_params)

    respond_to do |format|
      if @location_hour.save
        format.html { redirect_to location_hours_path, notice: 'Business hour was successfully created.' }
        format.json { render :show, status: :created, location: @location_hour }
      else
        format.html { render :new }
        format.json { render json: @location_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_hours/1
  # PATCH/PUT /location_hours/1.json
  def update
    respond_to do |format|
      if @location_hour.update(location_hour_params)
        format.html { redirect_to location_hours_path, notice: 'Business hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_hour }
      else
        format.html { render :edit }
        format.json { render json: @location_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_hours/1
  # DELETE /location_hours/1.json
  def destroy
    @location_hour.destroy
    respond_to do |format|
      format.html { redirect_to location_hours_url, notice: 'Location hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_hour
      @location_hour = LocationHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_hour_params
      params.require(:location_hour).permit(:name, :_destroy, hours_attributes: [:id, :day, :start_time, :end_time, :closed, :_destroy])
    end
end
