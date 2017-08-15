class Alert < ApplicationRecord
  validates :active, :phone, :alert_level, :zipcode, presence: true

end
