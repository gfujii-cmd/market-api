class V1::ProductsController < ApplicationController
  def index 
    @products = Product.all

    render json: @products, status: :ok
  end

  def create
    @product = Product.new(product_params)

    @product.save

    render json: @product, status: :created
  end

  def destroy
    @product = Product.where(id: params[:id]).first
    if @product.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :discount)
    end
end
