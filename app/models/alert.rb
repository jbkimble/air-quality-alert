class Alert < ApplicationRecord
  validates :active, :phone, :air_index_id, :zipcode, presence: true

  belongs_to :air_index
end
