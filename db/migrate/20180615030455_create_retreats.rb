class CreateRetreats < ActiveRecord::Migration[5.2]
  def change
    create_table :retreats do |t|
      t.integer :user_id
      t.string :description
      t.integer :cabin_capacity
    end
  end
end
