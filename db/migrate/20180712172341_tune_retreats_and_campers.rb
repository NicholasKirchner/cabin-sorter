class TuneRetreatsAndCampers < ActiveRecord::Migration[5.2]
  def up
    change_column :retreats, :cabin_capacity, :integer, null: false, default: 12
    change_column :retreats, :description,    :string,  null: false
    change_column :retreats, :user_id,        :integer, null: false
    
    change_column :campers, :gender,     :integer, null: false
    change_column :campers, :name,       :string,  null: false
    change_column :campers, :type,       :integer, null: false, default: :student
    change_column :campers, :retreat_id, :integer, null: false
  end

  def down
    change_column :retreats, :cabin_capacity, :integer, null: true, default: nil
    change_column :retreats, :description,    :string,  null: true
    change_column :retreats, :user_id,        :integer, null: true
    
    change_column :campers, :gender,     :integer, null: true
    change_column :campers, :name,       :string,  null: true
    change_column :campers, :type,       :integer, null: true, default: nil
    change_column :campers, :retreat_id, :integer, null: true
  end    
end
