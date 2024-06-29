class Task < ApplicationRecord
  belongs_to :contract
  validates :title, presence: true
end