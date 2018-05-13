require 'csv'

module Sorter

  def self.load_from_csv(file)
    people = []
    ::CSV.read(file, headers: true).each do |row|
      klass = (row["status"] == "Student" ? Student : Chaperone)
      people << klass.from_csv_row(row)
    end
    people.each do |person|
      person.preferences.each do |pref|
        pref[:student] = people.find { |p| p.is_a?(Student) && p.name == pref[:student] }
      end
    end
    Sorter::Sorter.new(people)
  end

end
