module ApplicationHelper
  
  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Redcarpet.new(text, *options).to_html.html_safe
  end
  
  def yes_or_no(boolean)
    boolean == true ? "yes" : "no"
  end
end
