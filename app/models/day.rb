class Day < ApplicationRecord
    has_and_belongs_to_many :exercises
    accepts_nested_attributes_for :exercises

    validates :name, presence: :true

    def exercises_attributes=(exercises_attributes)
        exercises_attributes.values.each do |exercise|
            if !exercise[:name].empty?
                self.exercises << Exercise.find_or_create_by(id: exercise[:id])
            end
        end
    end
end
