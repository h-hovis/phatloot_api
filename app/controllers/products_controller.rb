class ProductsController < ApplicationController
    before_action :authenticate_request, except: [:index]

    def index
        products = Product.all
        render json: ProductBlueprint.render(products, view: :normal), status: :ok
    end

    def show
        product = Product.find(params[:id])
        render json: ProductBlueprint.render(@product, view: :normal), status: :ok
    end

    def create
        product = @current_user.products.new(product_params)

        if product.save
            render json: ProductBlueprint.render(product, view: :normal), status: :created 
        else
            render json: product.errors, status: :unprocessable_entity
        end
    end

    def update
        product = Product.find(params[:id])
        product.update(product_params)

        if @product.update(product_params)
            render json: ProductBlueprint.render(@product, view: :normal), status: :ok
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    def destroy
        product = Product.find(params[:id])
        product.destroy

        if @product.destroy
            render json: nil, status: :ok
        else
            render json: @product.errors, status: :unprocessable_entity    
        end
    end

    def my_products
        products = @current_user.products

        render json: ProductBlueprint.render(products, view: :normal), status: :ok
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end
    def product_params
        params.require(:product).permit(:name, :category, :price, :description, :image_url)
    end
end
