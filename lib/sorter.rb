require 'csv'

module Sorter

  def self.load_from_csv_file(file)
    load_from_csv_table(::CSV.read(file, headers: true))
  end

  def self.load_from_csv_string(csv_string)
    load_from_csv_table(::CSV.parse(csv_string, headers: true))
  end

  def self.load_from_csv_table(table)
    people = []
    table.each do |row|
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
