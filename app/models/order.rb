class Order < ApplicationRecord
	validate :validate_discount_amount
	
  def validate_discount_amount
    if discount_amount > gross_amount
      errors.add(:discount_amount, "can not be bigger than gross amount")
    end
  end


end
