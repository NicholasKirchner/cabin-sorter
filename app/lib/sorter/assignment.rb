module Sorter
  class Assignment

    ADEQUATE_SUPERVISION_BONUS = 100
    TURNOVER_PENALTY = 50

    attr_reader :cabin_rosters
    
    def self.create(list_of_people, number_cabins)
      cabins = Array.new(number_cabins) { |cap| CabinRoster.new }
      list_of_people.each do |person|
        cabins.shuffle.each do |cabin|
          if cabin.room_for?(person)
            cabin.add_person!(person)
            break
          end
        end
      end
      new(cabins, list_of_people.length)
    end
    
    def initialize(cabin_rosters, total_people)
      @cabin_rosters = cabin_rosters
      @total_people = total_people
    end
    
    def find_person(person)
      @cabin_rosters.index { |cabin| cabin.people.include?(person) }
    end
    
    def goodness
      score = 0
      score -= 1_000_000 if @cabin_rosters.map(&:people).map(&:count).sum < @total_people
      @cabin_rosters.each do |roster|
        score += ADEQUATE_SUPERVISION_BONUS * roster.good_supervised_nights
        score -= TURNOVER_PENALTY unless roster.consistent_chaperone?
        roster.people.each do |person|
          person.preferences.each_with_index do |pref, i|
            if roster.has_person?(pref[:student])
              score += pref[:points]
            end
          end
        end
      end
      score
    end
    
    def move_person(person, cabin_index)
      old_cabin_index = find_person(person)
      new_rosters = @cabin_rosters.clone
      if old_cabin_index
        new_rosters[old_cabin_index] = new_rosters[old_cabin_index].remove_person(person)
      end
      new_rosters[cabin_index]     = new_rosters[cabin_index].add_person(person)
      Assignment.new(new_rosters, @total_people)
    end
    
    def swap_people(person1, person2)
      new_rosters = @cabin_rosters.clone
      old_cabin_index_1 = find_person(person1)
      old_cabin_index_2 = find_person(person2)
      new_rosters[old_cabin_index_1] = new_rosters[old_cabin_index_1].remove_person(person1).add_person(person2)
      new_rosters[old_cabin_index_2] = new_rosters[old_cabin_index_2].remove_person(person2).add_person(person1)
      Assignment.new(new_rosters, @total_people)
    end
    
    def to_s
      @cabin_rosters.map(&:to_s).join("\n")
    end
    
  end
end
