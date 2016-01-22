class Project < ActiveRecord::Base
  has_many :contracts, dependent: :destroy
  has_many :users, :through => :contracts

  has_many :hours  


  def get_hours period
    query = Time.zone.now.beginning_of_day
    output = 0

    #get query
    case period
    when "week"
      query = Time.zone.now.beginning_of_week
    when "month"
      query = Time.zone.now.beginning_of_month
    end

    hours = self.hours.where('hours.created_at >= ?', query)
    hours.each do |t| #get all hours for period
      output += t.hours
    end
    output
  end
end