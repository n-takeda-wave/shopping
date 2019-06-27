class ProductsController < ApplicationController
  before_action :require_store_logged_in, only: [:new, :create, :edit, :destroy]
  before_action :correct_store, only: [:destroy]
  
  def index
    @products = Product.search(params[:search]).page(params[:page])
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = current_store.products.build(product_params)

    if @product.save
      flash[:success] = '商品を登録しました。'
      redirect_to products_url
    else
      flash.now[:danger] = '商品の登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:success] = '正常に更新されました'
      redirect_to products_url
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def product_params
    params.require(:product).permit(:image, :title, :capture, :price)
  end
  
  def correct_store
    @product = current_store.products.find_by(id: params[:id])
    unless @product
      redirect_to login_url
    end
  end
end
