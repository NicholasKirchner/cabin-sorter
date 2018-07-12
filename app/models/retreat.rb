# == Schema Information
#
# Table name: retreats
#
#  id             :bigint(8)        not null, primary key
#  cabin_capacity :integer          default(12), not null
#  description    :string           not null
#  user_id        :integer          not null
#

class Retreat < ApplicationRecord

  belongs_to :user

  has_many :male_students,   -> { where(gender: :male) }, class_name: 'Camper'
  has_many :female_students, -> { where(gender: :female) }, class_name: 'Camper'

  def male_student_list
    male_students.collect(&:name).join("\n")
  end

  def male_student_list=(a_string)
    self.male_students = a_string.split("\n").map do |name|
      Camper.new(type: :student, name: name.strip, gender: :male)
    end
  end

  def female_student_list
    female_students.collect(&:name).join("\n")
  end

  def female_student_list=(a_string)
    self.female_students = a_string.split("\n").each do |name|
      Camper.new(type: :student, name: student, gender: :female)
    end
  end

end
