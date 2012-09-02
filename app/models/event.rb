class Event < ActiveRecord::Base
  ONCE = "once"
  DAILY = "daily"
  WEEKLY = "weekly"
  MONTHLY = "monthly"
  YEARLY = "yearly"
  RECURRENT_TYPES = [ONCE, DAILY, WEEKLY, MONTHLY, YEARLY]

  class Recurrent < Struct.new(:recurrent)
    def label

    end
  end

  attr_accessible :date, :name, :recurrent, :until_date

  validates :user, presence: true
  validates :date, presence: true
  validates :name, presence: true
  validates :recurrent, presence: true, inclusion: { in: RECURRENT_TYPES }

  belongs_to :user

  after_initialize :set_default_values, if: :new_record?

  scope :before_date, lambda { |date_end| where "date <= ?", date_end }

  def self.hash_for_period(date_range, events_scope = Event.scoped)
    events_hash = {}
    date_range.map { |dt| events_hash[dt] = [] }

    events = events_scope.before_date(date_range.end)
    events.each do |event|
      event.dates(date_range).each do |event_date|
        events_hash[event_date] << event
      end
    end
    events_hash
  end

  def dates(range)
    range = [range.begin, date].max..[range.end, until_date || range.end].min
    return [] if range.end < range.begin
    case recurrent
      when DAILY
        range.to_a
      when WEEKLY
        range.select { |range_date| range_date.cwday == date.cwday }
      when MONTHLY
        range.select { |range_date| range_date.day == date.day }
      when YEARLY
        range.select { |range_date| range_date.month == date.month && range_date.day == date.day }
      else
        range.cover?(date) ? [date] : []
    end
  end

  def to_s
    name
  end

  private

  def set_default_values
    self.date ||= Date.today
    self.recurrent ||= ONCE
  end
end
