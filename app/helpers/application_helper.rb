module ApplicationHelper
  def display_datetime(dt)
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end

  def fix_url(url)
    url.starts_with?('http://') ? url : "http://#{url}"
  end
end
