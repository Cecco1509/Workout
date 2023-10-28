class Day < ApplicationRecord
    has_and_belongs_to_many :exercises
    accepts_nested_attributes_for :exercises

    validates :name, presence: :true
    belongs_to :user

end
