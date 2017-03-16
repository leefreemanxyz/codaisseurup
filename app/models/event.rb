class Event < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :categories

    validates :name, presence: true
    validates :description, presence: true, length: { maximum: 500 }
    validate :end_after_start
    validate :starts_after_today
    validates :starts_at, presence: true
    validates :ends_at, presence: true

    def free?
        price == 0
    end

    def self.order_by_price
        order(:price)
    end

    private

    def starts_after_today
        return if starts_at.blank?
        errors.add(:starts_at, 'must be after today') if starts_at < DateTime.now
    end

    def end_after_start
        return if ends_at.blank? || starts_at.blank?
        if ends_at < starts_at
            errors.add(:ends_at, 'must be after the start date')
        end
    end
end
