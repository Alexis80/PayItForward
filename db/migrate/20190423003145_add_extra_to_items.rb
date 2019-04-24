class AddExtraToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :extra, :boolean, :default => false
  end
end
