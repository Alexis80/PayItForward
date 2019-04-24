class RelationshipsController < ApplicationController
  
  #modified from railstutorial.org on 4/22/19
  before_action :logged_in_user

  def create
    session[:return_to] ||= request.referer
    user = User.find(params[:donor_id])
    user.request_access(current_user)
    redirect_to session.delete(:return_to)
  end

  def destroy
    session[:return_to] ||= request.referer
    @relationship = Relationship.find(params[:id])
    @receiver = @relationship.receiver
    @donor = @relationship.donor
    @donor.delete_access(@receiver)
   redirect_to session.delete(:return_to)
  end
end
