class Order < ApplicationRecord
	validates  :first_name, :last_name, :gross_amount, presence: true

	validate :validate_discount_amount
	validate :validate_is_gross_amount_positive_value
  validate :validate_is_discount_amount_positive_value
  # validate :validate_is_currency_TL_or_USD_or_EUR
  validates :currency,presence:true, inclusion: { in: ["TL","USD","EUR"]}
  def validate_is_gross_amount_positive_value
    if gross_amount.present?
      if  gross_amount < 0
        errors.add(:gross_amount, "gross_amount should positive value")
     end
    end
  end
 
  def validate_is_discount_amount_positive_value
    if  discount_amount.present?
      if discount_amount < 0
        errors.add(:discount_amount, "discount_amount should positive value")
      end
    end
  end

  def validate_discount_amount
    if discount_amount.present?
      if discount_amount > gross_amount
        errors.add(:discount_amount, "can not be bigger than gross amount")
      end
    end
  end


end
