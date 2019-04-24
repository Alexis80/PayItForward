class CreateItems < ActiveRecord::Migration[5.2]

  def change
    drop_table :items 
    create_table :items do |t|
      t.text :name
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :items, [:user_id, :created_at]

  end
end
