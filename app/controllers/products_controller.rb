class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end
  
  def show
    @product = Product.find_by(params[:id])
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
    @product = Product.find(params[:id])
    @product.destroy
    
    flash[:success] = "正常に削除されました"
    redirect_to products_url
  end

  private

  def product_params
    params.require(:product).permit(:image, :title, :capture, :price)
  end
end
