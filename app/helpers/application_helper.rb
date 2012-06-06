module ApplicationHelper
  
  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Redcarpet.new(text, *options).to_html.html_safe
  end
  
  def yes_or_no(boolean)
    boolean == true ? "yes" : "no"
  end
  
  def is_current(path)
    if request.request_uri == path
      return 'current'
    end
  end
  
  def private_address(property)
    [property.street.strip, property.apt.strip, property.city.strip, property.state.strip, property.zipcode.strip, property.country].join(', ').gsub(', , ', ', ')
  end
  
  def public_address(property)
    [property.street.gsub(/[^A-Za-z, ]/i, '').strip, property.city.strip, property.state.strip, property.zipcode.strip, property.country].join(', ').gsub(', , ', ', ')
  end
end
