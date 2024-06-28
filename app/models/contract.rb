class Contract < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def formatted_rate
    "$#{'%.2f' % rate}/hr"
  end
end
