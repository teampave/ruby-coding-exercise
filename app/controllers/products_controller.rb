class ProductsController < ApplicationController
  def index
    @products = Product.in_stock
  end

  def show
    @product = Product.find params[:id]
  end
end
