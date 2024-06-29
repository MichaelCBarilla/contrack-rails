class Contract < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, presence: true
  validates :rate, presence: true


  def formatted_rate
    "$#{'%.2f' % rate}/hr"
  end
end
