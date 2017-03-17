class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def set_total_price
    self.price = event.price * guests_count
  end

  def set_status
    self.status = "confirmed"
  end
end
