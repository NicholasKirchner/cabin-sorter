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

end
