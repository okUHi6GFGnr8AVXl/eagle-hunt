class ShoppingCart < ApplicationRecord
  belongs_to :user
  belongs_to :furniture
end