require 'test_helper'

class ProductTaxesControllerTest < ActionController::TestCase
  setup do
    @product_tax = product_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_tax" do
    assert_difference('ProductTax.count') do
      post :create, product_tax: { name: @product_tax.name, value: @product_tax.value }
    end

    assert_redirected_to product_tax_path(assigns(:product_tax))
  end

  test "should show product_tax" do
    get :show, id: @product_tax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_tax
    assert_response :success
  end

  test "should update product_tax" do
    patch :update, id: @product_tax, product_tax: { name: @product_tax.name, value: @product_tax.value }
    assert_redirected_to product_tax_path(assigns(:product_tax))
  end

  test "should destroy product_tax" do
    assert_difference('ProductTax.count', -1) do
      delete :destroy, id: @product_tax
    end

    assert_redirected_to product_taxes_path
  end
end
