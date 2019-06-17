class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end
  
  def new
    @product = Product.new
  end
end
