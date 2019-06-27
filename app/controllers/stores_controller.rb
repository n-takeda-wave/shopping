class StoresController < ApplicationController
  def index
    @stores = Store.all.page(params[:page])
  end

  def show
    @store = Store.find(params[:id])
    @products = @store.products.order("created_at DESC").page(params[:page])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      flash[:success] = '店舗を登録しました。'
      redirect_to @store
    else
      flash.now[:danger] = '店舗の登録に失敗しました。'
      render :new
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :email, :password, :password_confirmation)
  end
end
