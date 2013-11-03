class ProductsController < ApplicationController

	before_action :adminize, only: [:new, :create, :edit, :update, :destroy]
	
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.create(params[:product].permit(:name, :description, :price_in_euros))
		if @product.save
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product].permit :name, :description, :price_in_euros)
			redirect_to root_url
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to root_url
	end
end
