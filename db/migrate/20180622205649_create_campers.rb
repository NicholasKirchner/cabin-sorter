class CreateCampers < ActiveRecord::Migration[5.2]
  def change
    create_table :campers do |t|
      t.integer :retreat_id
      t.integer :type #will be student or chaperone
      t.string :name
      t.integer :gender
      t.string :pin_hash
    end
  end
end
