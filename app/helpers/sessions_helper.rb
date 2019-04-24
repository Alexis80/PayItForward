module SessionsHelper
	# Logs in the given user.
	# from railstutorial.org on 4/19/19
	def log_in(user)
    		session[:user_id] = user.id
 	 end
	#returns current user
	def current_user
    		if session[:user_id]
      		@current_user ||= User.find_by(id: session[:user_id])
    		end
  	end
        
        #is current user logged in?
	def logged_in?
    		!current_user.nil?
  	end

	#returns true if current user is the input user
        def current_user?(user)
    		user == current_user
  	end
        
	#stores location of address attempting to be accessed
        def store_location
    		session[:forwarding_url] = request.original_url if request.get?
  	end	
	#logs out user
	def log_out
    		session.delete(:user_id)
    		@current_user = nil
  	end
end
