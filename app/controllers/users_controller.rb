class UsersController < ApplicationController
#code modified from railstutorial.org
 #checks if user is logged in for edit and update functions
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  #only a user can edit their own info
  before_action :correct_user,   only: [:edit, :update]

  #before deleting checks if the user is an admin
  before_action :admin_user,     only: :destroy

  #find a user
  def show
	@user = User.find(params[:id])
	@microposts = @user.microposts.paginate(page: params[:page])
        @micropost = current_user.microposts.build if logged_in?
        @items = Item.all
  end

  #show all users, paginating them so that they are not all on the same page
  def index
	@users = User.paginate(page: params[:page])
        @items = Item.all
  end

  #new user
  def new
	@user = User.new
  end

  #creates a user and if save is successful, welcomes them
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
     log_in @user
     flash[:success] = "Welcome to Pay It Forward!"
     redirect_to @user
    #else goes back to new user page
    else
       render 'new'
    end
   end

   #fnd the user to be edited
   def edit
    @user = User.find(params[:id])
  end

    #updates user info
   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  
  #checks if current user is trying to access correct info
   def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
   end
    
  #deletes user
   def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_url
   end
    
   #find a user's access
   def alist
      @donor = current_user.donors
      @receiver = current_user.receivers
      
   end

   #checks if the user is an admin
   def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

  private
  
    #requires all users to have info
    def user_params
      params.require(:user).permit(:name, :email, :password,:address,
                                   :password_confirmation)
    end

    
end
