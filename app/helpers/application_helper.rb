module ApplicationHelper
  
  # def role(current_user)
  #   if current_user
  #     user = current_user
  #     today = Date.today
  #     payments = user.payments.all
  #     if payments
  #       payments.each do |payment|
  #         after = payment.start_date
  #         before = payment.end_date
  #         if payment.where(today => after..before)
  #           payment_found = true
  #         end
  #       end
  #       if payment_found == false
  #         redirect_to member_registration_payment_path
  #       end
  #     else
  #       redirect_to member_registration_payment_path
  #     end
  #   end
  # end
  
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
  
  def featured_property_photo(property_id)
    @featured_photo = Photo.where(:property_id => property_id, :image_processing.ne => true).asc(:position).first
  end
  
  def link_to_submit(text)
    link_to_function text, "$(this).closest('form').submit()"
  end
  
  def to_slug(param)
    # strip the string
    ret = param.strip.downcase

    #blow away apostrophes
    ret.gsub! /['`]/, ""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    # replace all non alphanumeric, periods with dash
    ret.gsub! /\s*[^A-Za-z0-9\.]\s*/, '-'

    # replace underscore with dash
    ret.gsub! /[-_]{2,}/, '-'

    # convert double dashes to single
    ret.gsub! /-+/, "-"

    # strip off leading/trailing dash
    ret.gsub! /\A[-\.]+|[-\.]+\z/, ""

    ret
  end
end
