# == Schema Information
#
# Table name: campers
#
#  id         :bigint(8)        not null, primary key
#  gender     :integer
#  name       :string
#  pin_hash   :string
#  type       :integer
#  retreat_id :integer
#

class Camper < ApplicationRecord

  belongs_to :retreat

  enum gender: [:male, :female]
  enum type:   [:student, :chaperone]
  
end
