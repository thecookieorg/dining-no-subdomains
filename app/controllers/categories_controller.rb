class CategoriesController < ApplicationController
  before_action :authenticate_merchant!
  #before_action :owned_category, only: [:edit, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = current_merchant.categories
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    # This is not allowing other merchants to see owners category by simply switching the :id in the URL
    @category = current_merchant.categories.find(params[:id]) rescue redirect_to(root_path)
  end

  # GET /categories/new
  def new
    @category = current_merchant.categories.build
  end

  # GET /categories/1/edit
  def edit
    #@category = current_merchant.categories.find(params[:id]) rescue redirect_to(root_path)
    #@category = current_merchant.categories.find(params[:id])
    
    #if current_merchant == @category.merchant
    #  @post.edit
    #else
    #  redirect_to root_path, error: "You don't have permission."
    #end
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = current_merchant.categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :merchant_id, :location_ids)
    end

    def owned_category  
      if current_merchant != @category.merchant
      #unless current_merchant == @category.merchant
        flash[:alert] = "That category doesn't belong to you!"
        redirect_to root_path
      end
    end 
end
