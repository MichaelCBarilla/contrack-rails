class User < ApplicationRecord
  has_many :contracts
  has_many :tasks
end
