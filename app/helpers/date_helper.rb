module DateHelper
  def convert_utc_to_local(utc_time)
    utc_time.in_time_zone(current_user.time_zone)
  end
end