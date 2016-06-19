class Spent < ActiveRecord::Base
  has_one :deputy
  has_many :expense_types
end
