require 'rails_helper'

RSpec.describe Camper, type: :model do
  before :each do
    @male_student = build(:male_student)
  end

  it "should respond to a query about gender" do
    expect(@male_student.male?).to be(true)
  end
end
