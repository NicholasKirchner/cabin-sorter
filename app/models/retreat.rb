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

  def male_student_list
    male_students.collect(&:name).join("\n")
  end

  def male_student_list=(a_string)
    a_string.split("\n").each do |student|
      self.male_students << Camper.new(type: 0, name: student, gender: 0)
    end
  end

  def female_student_list
    female_students.collect(&:name).join("\n")
  end

  def female_student_list=(a_string)
    a_string.split("\n").each do |student|
      self.female_students << Camper.new(type: 0, name: student, gender: 1)
    end
  end

end
