class User < ApplicationRecord
	#from railstutorial.org on 4/22/19
	has_secure_password
        has_many :microposts, dependent: :destroy
	has_many :items, dependent: :destroy
	validates :password, presence: true, length: { minimum: 6 }
	has_many :conversations, :foreign_key => :sender_id
        has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "donor_id",
                                  dependent:   :destroy
	has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "receiver_id",
                                   dependent:   :destroy
        has_many :donors, through: :passive_relationships, source: :donor
	has_many :receivers, through: :active_relationships,  source: :receiver
	before_save { self.email = email.downcase }
	#from railstutorial.org
	#name,email,and address must be present for users
	#length should also be limited
	validates(:name, presence: true, length: {maximum: 50})
	validates(:email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false })
	validates(:address, presence: true, length: { maximum: 255 })

	def User.digest(string)
    		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    		BCrypt::Password.create(string, cost: cost)
        end

	#selects all of users posts as a feed
	def feed
		Micropost.where("user_id = ?", id)
  	end

	#users items selected
	def item_feed
    		Item.where("user_id = ?", id)
  	end

	# Follows a user.
	def request_access(other_user)
		receivers << other_user
	end
	
	# Unfollows a user.
	def delete_access(other_user)
		receivers.delete(other_user)
	end
	
	# Returns true if the current user has access to the other user.
	def receivers?(other_user)
		receivers.include?(other_user)
	end

	 # Returns true if the current user gave access to the other user.
	def donors?(other_user)
		donors.include?(other_user)
	end
	 
end
