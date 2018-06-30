# == Schema Information
#
# Table name: retreats
#
#  id             :bigint(8)        not null, primary key
#  cabin_capacity :integer
#  description    :string
#  user_id        :integer
#

class Retreat < ApplicationRecord

  belongs_to :user

  has_many :male_students,   -> { where(gender: 'M') }, class_name: 'Camper'
  has_many :female_students, -> { where(gender: 'F') }, class_name: 'Camper'


  
end
