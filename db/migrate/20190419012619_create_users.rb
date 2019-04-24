class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    #generated Rails code
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
