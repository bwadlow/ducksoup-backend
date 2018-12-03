class List < ApplicationRecord
  has_many :cards
  belongs_to :board
end
