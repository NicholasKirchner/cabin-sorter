# == Schema Information
#
# Table name: campers
#
#  id         :bigint(8)        not null, primary key
#  gender     :integer          not null
#  name       :string           not null
#  pin_hash   :string
#  type       :integer          not null
#  retreat_id :integer          not null
#

class Camper < ApplicationRecord

  belongs_to :retreat

  enum gender: [:male, :female]
  enum type:   [:student, :chaperone]
  
end
