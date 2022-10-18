class Product < ApplicationRecord
  scope :in_stock, -> { where("quantity_in_stock > 0") }

  monetize :cost_cents
end
