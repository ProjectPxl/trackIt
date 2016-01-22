module ApplicationHelper

  def get_today_hours hours
    total = 0
    hours.each do |h|
      total += h.hours
    end
    total
  end
end
