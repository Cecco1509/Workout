class Exercise < ApplicationRecord
    has_and_belongs_to_many :days
    validates :name, :sets, :reps, :rest, presence: :true
end

