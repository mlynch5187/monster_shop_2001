class Discount < ApplicationRecord
  validates_presence_of :name, :percentage

  belongs_to :merchant
end
