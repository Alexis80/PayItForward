class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :donor_id
      t.integer :receiver_id

      t.timestamps
    end

    add_index :relationships, :donor_id
    add_index :relationships, :receiver_id
    add_index :relationships, [:donor_id, :receiver_id], unique: true
  end
end
