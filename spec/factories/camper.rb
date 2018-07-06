FactoryBot.define do
  factory :camper do

    trait :male do
      gender :male
      name { "#{Faker::Name.male_first_name} #{Faker::Name.last_name}" }
    end
    
    trait :female do
      gender :female
      name { "#{Faker::Name.female_first_name} #{Faker::Name.last_name}" }
    end

    trait :student do
      type :student
    end

    trait :chaperone do
      type :chaperone
    end

    factory :male_student, traits: [:male, :student]
  end
end
