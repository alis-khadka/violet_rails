module AhoyVisitData
  extend ActiveSupport::Concern

  def track_or_create_ahoy_visit
    track_ahoy_visit

    if current_visit.blank?
      # TO DO: Update this approach if found a better way.
      set_ahoy_cookies
      @ahoy.track_visit
    end
  end
end