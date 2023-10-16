require 'time'

class Event
  attr_accessor :start_date, :duration, :title, :attendees
  def initialize(start_date, duration, title, attendees)
      @start_date = Time.parse(start_date)
      @duration = duration
      @title = title
      @attendees = attendees
    end
    def postpone_24h
      @start_date += 24 * 60 * 60 
    end
    def end_date
      @start_date + (@duration * 60) 
    end
    def is_past?
      @start_date < Time.now
    end
    def is_future?
      !is_past?
    end
    def is_soon?
      @start_date - Time.now < 30 * 60
    end#30min en sec
    def to_s
      ">Titre : #{@title}\n>Date de début : #{@start_date.strftime("%Y-%m-%d %H:%M")}\n>Durée : #{@duration} minutes\n>Invités : #{attendees.join(', ')}"
    end#\n saute la ligne
    def self.find_by_email(email)
      @@all_users.find { |user| user.email == email }
    end
  end


