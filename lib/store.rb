class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true }

  validate :at_least_one_mens_or_womens_apparel

  def at_least_one_mens_or_womens_apparel
    if !mens_apparel.present? && !womens_apparel.present?
      errors.add(:mens_apparel, "must have 1 men or womens apparel")
    end
  end
end
