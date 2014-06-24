class ProductsController < ApplicationController
  def index
  	@products = Product.all 	#this line sets @products to all products to be shown on index
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new							#generating new instance of product model
  end

  def edit
  	@product = Product.find(params[:id])				#id stays the same with edit
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_url
  	else
  		render :new
  	end
  end

  def update 
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product)							#product (singular) b/c we are only updating one
  	else
  		render :edit
  	end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end								#productS goes back to the list of ALL products once you delete one

	private
	def product_params
		params.require(:product).permit(:name, :description, :price_in_cents)
	end
  
end




#product params will only allow these fields, name, description, etc. You must put this! Create, edit
#and update will only allow these params.
