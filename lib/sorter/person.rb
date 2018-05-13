module Sorter
  class Person

    attr_reader :name, :night, :preferences, :gender
    
    def self.from_csv_row(row)
      opts = {}
      [:name, :gender, :night].each { |column| opts[column] = row[column.to_s] }
      opts[:preferences] = []
      (1..3).each do |i|
        if row["preference_#{i}"]
          opts[:preferences] << { student: row["preference_#{i}"],
                                  points:  row["points_#{i}"].to_i }
        end
      end
      new(opts)
    end
    
    def initialize(opts)
      puts opts
      @name = opts[:name]
      @preferences = opts[:preferences]
      @gender = opts[:gender]
      @night = opts[:night]
     end
    
    def prefs_to_s
      preferences.map { |p| p[:student] }.map(&:name)
    end
    
    def present_on_night?(night)
      night = night.to_s
      @night.nil? || night == @night
    end
    
    def to_s
      @name
    end
    
    def inspect
      "#{self.class}(name: #{@name}, preferences: #{prefs_to_s}, gender: #{@gender}, night: #{@night})"
    end
    
  end
  
  class Student < Person
    
  end
  
  class Chaperone < Person
    
  end
end
