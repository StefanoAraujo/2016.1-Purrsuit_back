class Spent < ActiveRecord::Base
  belongs_to :deputy
  has_many :expense_types
end
