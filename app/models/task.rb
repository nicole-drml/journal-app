class Task < ApplicationRecord
    validates :name, presence: true, length: {maximum: 20}
    validates :due, presence: true

    belongs_to :category
end
