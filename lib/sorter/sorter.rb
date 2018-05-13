module Sorter
  class Sorter

    def initialize(list_of_people)
      @people_by_gender = list_of_people.group_by(&:gender)
    end
  
    def best_sortings
      return @best_sortings if @best_sortings
      assignments = @people_by_gender.map do |gender, people|
        Optimizer.new(people).run
      end
      @best_sortings = assignments.map(&:cabin_rosters).flatten
    end

    def convert_to_csv(output_file)
      ::CSV.open(output_file, "wb") do |result|
        best_sortings.each_with_index do |cabin, idx|
          result << ["Cabin #{idx + 1}"]
          result << ["Name", "Gender", "Status", "Night"]
          cabin.people.sort_by { |p| p.class.to_s }.each do |person|
            result << [person.name, person.gender, person.class, person.night]
          end
          result << []
        end
      end
    end
    
  end
end
