module Sorter
  class Optimizer

    def initialize(list_of_people)
      @people = list_of_people
    end

    def run
      best_assignment = OpenStruct.new(goodness: 0)
      100.times do |i|
        current_assignment = Assignment.create(@people, number_cabins)
        begin
          old_score = current_assignment.goodness
          current_assignment = move_folks(current_assignment)
          current_assignment = swap_folks(current_assignment)
        end until old_score == current_assignment.goodness
        
        puts "Loop #{i}: High Score: #{current_assignment.goodness}"
        
        if current_assignment.goodness > best_assignment.goodness
          best_assignment = current_assignment
        end
      end
      best_assignment
    end
    
    def number_cabins
      @cabins ||= @people.count { |p| p.is_a? Student }.-(1)./(9).+(1)
    end
    
    def move_folks(assignment)
      @people.shuffle.each do |person|
        number_cabins.times do |cabin_index|
          new_assignment = assignment.move_person(person, cabin_index)
          if new_assignment.goodness > assignment.goodness
            assignment = new_assignment
          end
        end
      end
      assignment
    end
    
    def swap_folks(assignment)
      @people.shuffle.each do |person1|
        @people.shuffle.each do |person2|
          if person1 == person2
            next
          end
          new_assignment = assignment.swap_people(person1, person2)
          if new_assignment.goodness > assignment.goodness
            assignment = new_assignment
          end        
        end
      end
      assignment
    end

  end
end
