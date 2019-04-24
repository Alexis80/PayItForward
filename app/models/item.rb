class Item < ApplicationRecord
  belongs_to :user
  #modified from railstutorial.org
   default_scope -> { order(name: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50}

  private
        def item_params
          params.require(:item).permit(:name, :description, :extra)
        end 
end
