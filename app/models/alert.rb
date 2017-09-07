class Alert < ApplicationRecord
  validates :phone, :air_index_id, :zipcode, presence: true
  validates_inclusion_of :active, :in => [true, false]
  belongs_to :air_index

  def styled_number
    phone_number = self.phone
    (phone_number[0..2] + "-" + phone_number[3..5] + "-" +  phone_number[6..9])
  end
end
