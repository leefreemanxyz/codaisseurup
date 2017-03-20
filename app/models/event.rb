class Event < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :categories
    has_many :photos
    has_many :registrations, dependent: :destroy
    has_many :guests, through: :registrations, source: :user

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

    def self.alphabetical
      order(name: :asc)
    end

    def self.published
      where(active: true)
    end


    def self.during(starts_at,ends_at)
      starts_before_and_ends_after(starts_at,ends_at)
      .or(starts_during(starts_at, ends_at))
      .or(ends_during(starts_at,ends_at))
    end

    def self.starts_before_and_ends_after(starts_at,ends_at)
      where('starts_at < ? AND ends_at > ?', starts_at, ends_at)
    end

    def self.starts_during(starts_at,ends_at)
      where('starts_at > ? AND starts_at < ?', starts_at, ends_at)
    end

    def self.ends_during(starts_at,ends_at)
      where('ends_at > ? AND ends_at < ?', starts_at, ends_at)
    end

    def self.registered_during(starts_at, ends_at)
      during(starts_at, ends_at).pluck(:event_id)
    end

    def self.order_by_date_created
      order(created_at: :desc)
    end

    def self.earliest_registration_for_event
      order(created_at: :desc).limit(1)
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
