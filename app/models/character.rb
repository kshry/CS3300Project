class Character < ApplicationRecord
    validates :name, :character_class, :description, presence: true
    validates :level, numericality: {greater_than_or_equal_to: 0}, presence: true
end
