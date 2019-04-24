class ItemsController < ApplicationController

	# modified from railstutorial.org
	#
	#  #checks if user is logged in for edit, update, create, and destroy functions
	before_action :logged_in_user, only: [:index, :create, :edit, :update, :destroy]
	
  	#only a user can edit their own info
  	before_action :correct_user,   only: [:edit, :update, :destroy]

	#find an item
	def show
		@item = Item.find(params[:id])
	end
	 
	#show all items
	def index
		@items = Item.all
	end
	
	#new item
	def new
		@item = Item.new
	end
	
	#finds item by ID
	def edit
		@item = Item.find(params[:id])
  	end

	#edits item and checks if it was a success
  	def update
    		@item = Item.find(params[:id])
    		if @item.update_attributes(item_params)
      			 flash[:success] = "Item updated successfully."
      			redirect_to items_path
    		else
      			render('edit')
    		end
  	end

	#creates an item and checks if it was a success
	def create

    		@item = current_user.items.build(item_params)
    		if @item.save
      			flash[:success] = "Item created!"
      			redirect_to items_path
    		else
      			@feed_items = []
      			render 'static_pages/home'
    		end
  	end
	#deletes the item
  	def destroy
    		@item.destroy
    		flash[:success] = "Item deleted"
    		redirect_to items_path
  	end

  	private
	#item parameters
    	def item_params
      		params.require(:item).permit(:name, :description, :extra)
    	end
	
	#is the correct user trying to edit, delete the items
  	def correct_user
      		@item = current_user.items.find_by(id: params[:id])
      		redirect_to root_url if @item.nil?
    	end

end
