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

require 'rails_helper'

RSpec.describe Camper, type: :model do
  before :each do
    @male_student = build(:male_student)
  end

  it "should respond to a query about gender" do
    expect(@male_student.male?).to be(true)
  end
end
