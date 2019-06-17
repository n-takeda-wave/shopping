class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to products_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :title, :capture, :price)
  end
end
