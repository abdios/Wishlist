class WishesController < ApplicationController
	before_action :authorize, only: [:new, :create, :show, :destroy]

	def index
		@wishes = Wish.find_all_by_user_id(current_user)

		#@wishes = Wish.all
	end

	def create
		@wish = Wish.create(:product_id => params[:product_id], :user_id => current_user.id)
		#@wish.user_id = current_user.id
		if @wish.save
			redirect_to wishes_path
		else
			render 'new'
		end
	end

	def destroy
		@wish = Wish.find(params[:id])
		@wish.destroy
		redirect_to wishes_path
	end
end
