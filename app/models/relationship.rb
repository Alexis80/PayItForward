class Relationship < ApplicationRecord
	#modified from railstutorial.org on 4/21/19
	belongs_to :receiver, class_name: "User"
  	belongs_to :donor, class_name: "User"
	validates :donor_id, presence: true
  	validates :receiver_id, presence: true
end
