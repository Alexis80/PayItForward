class User < ApplicationRecord
  #add validation to user name
  validates :name, presence: true
  #add validation to user email
  validates :email, presence: true
 
  #converts email to lowercase before saving
  before_save { self.email = email.downcase }
  #validation for length of name 
  validates :name,  presence: true, length: { maximum: 40 }
  #validation for length and format of emails plus duplications
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
			format: { with: VALID_EMAIL_REGEX },
			uniqueness: { case_sensitive: false }


  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
end
