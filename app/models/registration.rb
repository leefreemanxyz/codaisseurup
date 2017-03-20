class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def set_total_price
    self.price = event.price * guests_count
  end

  def set_status
    self.status = "confirmed"
  end

  def self.total_registrations
    count
  end

  def self.total_registrations_by_status
    group(:status).count
  end

  def self.amount_attending(event)
    where('event.id == ?', event.id).count
  end
end
