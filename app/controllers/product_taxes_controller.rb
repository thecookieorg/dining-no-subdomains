class ProductTaxesController < ApplicationController
  before_action :set_product_tax, only: [:show, :edit, :update, :destroy]

  # GET /product_taxes
  # GET /product_taxes.json
  def index
    @product_taxes = ProductTax.all
  end

  # GET /product_taxes/1
  # GET /product_taxes/1.json
  def show
  end

  # GET /product_taxes/new
  def new
    @product_tax = current_merchant.product_taxes.build
  end

  # GET /product_taxes/1/edit
  def edit
  end

  # POST /product_taxes
  # POST /product_taxes.json
  def create
    @product_tax = current_merchant.product_taxes.build(product_tax_params)

    respond_to do |format|
      if @product_tax.save
        format.html { redirect_to product_taxes_path, notice: 'Product tax was successfully created.' }
        format.json { render :show, status: :created, location: @product_tax }
      else
        format.html { render :new }
        format.json { render json: @product_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_taxes/1
  # PATCH/PUT /product_taxes/1.json
  def update
    respond_to do |format|
      if @product_tax.update(product_tax_params)
        format.html { redirect_to product_taxes_path, notice: 'Product tax was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_tax }
      else
        format.html { render :edit }
        format.json { render json: @product_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_taxes/1
  # DELETE /product_taxes/1.json
  def destroy
    @product_tax.destroy
    respond_to do |format|
      format.html { redirect_to product_taxes_url, notice: 'Product tax was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_tax
      @product_tax = ProductTax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_tax_params
      params.require(:product_tax).permit(:name, :value, :merchant_id)
    end
end
