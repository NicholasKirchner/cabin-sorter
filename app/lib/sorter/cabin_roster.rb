module Sorter
  class CabinRoster

    #TODO: eventually refactor these out and pass in as parameters with these defaults
    CABIN_CAPACITY = 12
    MAX_STUDENTS_PER_CHAPERONE = 5
    MIN_STUDENTS_PER_CHAPERONE = 2
    NIGHTS = 2
    MIN_CHAPERONES_PER_CABIN = 2
    
    attr_reader :people
    
    def initialize(people = [], capacity = CABIN_CAPACITY)
      @capacity = capacity
      @people = people
    end
    
    def has_person?(person)
      @people.include?(person)
    end
    
    def add_person!(person)
      @people << person if room_for?(person)
    end
    
    def add_person(person)
      room_for?(person) ? CabinRoster.new(@people + [person]) : self
    end
    
    def remove_person(person)
      CabinRoster.new(@people - [person])
    end
    
    def room_for?(person)
      empty_beds(person.night) > 0
    end
    
    def good_supervised_nights
      (1..NIGHTS).count do |night|
        students =   @people.select { |p| p.is_a?(Student)   && p.present_on_night?(night) }
                            .length
        chaperones = @people.select { |p| p.is_a?(Chaperone) && p.present_on_night?(night) }
                            .length

        students < chaperones * MAX_STUDENTS_PER_CHAPERONE &&
        students > chaperones * MIN_STUDENTS_PER_CHAPERONE &&
        chaperones >= MIN_CHAPERONES_PER_CABIN
      end
    end

    def consistent_chaperone?
      @people.select { |p| p.is_a?(Chaperone) && p.night.nil? }.any?
    end
    
    def empty_beds(night = nil)
      if night
        occupancy = @people.count { |p| p.present_on_night?(night) }
      else
        occupancy = (1..NIGHTS).map do |a_night|
          @people.count { |p| p.present_on_night?(a_night) }
        end.max
      end
      @capacity - occupancy
    end
    
    def to_s
      students   = @people.select { |p| p.is_a?(Student)   }.map(&:name).join(", ")
      chaperones = @people.select { |p| p.is_a?(Chaperone) }.map(&:name).join(", ")
      "Students: #{students}\nChaperones: #{chaperones}"
    end
    
  end
end
