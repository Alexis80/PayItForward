class ApplicationController < ActionController::Base
   #from railstutorial.org on 4/18/19
        protect_from_forgery with: :exception
        include SessionsHelper
        rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    render :template => "errors/error_404", :status => 404
  end
  private

  def logged_in_user
      unless logged_in?

        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
