class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Products::ProductsSearchService.new(search_params).call

    respond_to do |format|
      format.html
      format.json { render json: @products, each_serializer: ProductSerializer }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to(products_path, notice: 'Product was successfully created.')
    else
      render :new
    end
  end

  private

  def search_params
    params.permit(:name, :min_price, :max_price, :created_at)
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
