# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #
    primary.item :welcome, I18n.t(:home, :scope => [:general, :menu]), root_url
    primary.item :locations, I18n.t(:finding, :scope => [:general, :menu]), location_about_path
    primary.item :rentals, I18n.t(:renting, :scope => [:general, :menu]), rentals_path
    primary.item :lastminute, I18n.t(:lastminute, :scope => [:general, :menu]), lastminutes_path
    primary.item :renovations, I18n.t(:renovation, :scope => [:general, :menu]), renovations_about_path
    primary.item :services, I18n.t(:services, :scope => [:general, :menu]) do |s|
      s.item :property, I18n.t(:property_management, :scope => [:general, :menu]), services_static_path('property-management')
      s.item :client, I18n.t(:client_management, :scope => [:general, :menu]), services_static_path('client-management')
      s.item :marketing, I18n.t(:marketing, :scope => [:general, :menu]), services_static_path('marketing')
      s.item :investment, I18n.t(:investment_development, :scope => [:general, :menu]), services_static_path('investment-development')
      s.item :relocation, I18n.t(:relocation, :scope => [:general, :menu]), services_static_path('relocation')
      s.item :chauffeur, I18n.t(:chauffeur_services, :scope => [:general, :menu]), services_static_path('chauffeur')
      s.item :jet, I18n.t(:private_jet, :scope => [:general, :menu]), services_static_path('private-jet')
      s.item :security, I18n.t(:security_advice, :scope => [:general, :menu]), services_static_path('security')
      s.item :language, I18n.t(:language_services, :scope => [:general, :menu]), services_static_path('language')
      s.item :maintenance, I18n.t(:property_maintenance, :scope => [:general, :menu]), services_static_path('maintenance')
    end
    primary.item :sales, I18n.t(:sales, :scope => [:general, :menu]), sales_about_path
    primary.item :company, I18n.t(:company, :scope => [:general, :menu]) do |s|
      s.item :about, I18n.t(:about_us, :scope => [:general, :menu]), company_about_path
      s.item :team, I18n.t(:the_team, :scope => [:general, :menu]), company_team_path
      s.item :accreditation, I18n.t(:accreditation, :scope => [:general, :menu]), company_static_path('blackdog-accreditation')
      s.item :testimonials, I18n.t(:testimonials, :scope => [:general, :menu]), company_testimonials_path
      s.item :show_case, I18n.t(:gallery, :scope => [:general, :menu]), company_static_path('gallery')
    end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    # primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
    # primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'
    primary.dom_class = 'sf-menu'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
