class Alert < ApplicationRecord
  validates :phone, :air_index_id, :zipcode, presence: true
  validates_inclusion_of :active, :in => [true, false]
  belongs_to :air_index
end
