# RailsAdmin config file. Generated on May 18, 2012 15:04
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_admin } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, Admin

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, Admin

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['BlackDog Property', 'Administration']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  config.excluded_models = [Country, Interest, Source, Support, Type]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Member, Photo, Property, Testimonial, User, Admin]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  config.models do
    configure :_type, :hidden 
    configure :_id, :hidden
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
    # edit do
    #   fields_of_type :text do
    #     ckeditor true
    #   end
    # end
    # create do
    #   fields_of_type :text do
    #     ckeditor true
    #   end
    # end
  end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  config.model Property do
    weight 1
    # Found associations:
    configure :country, :belongs_to_association 
    configure :types, :has_and_belongs_to_many_association 
    configure :photos, :has_many_association
    configure :_type, :hidden 
    configure :_id, :hidden
    configure :title, :string 
    configure :location, :string 
    configure :reference, :string 
    configure :bio, :text
    configure :description, :text
    configure :facilities, :text
    configure :price_sale, :string 
    configure :price_rental, :text
    configure :coordinates, :serialized 
    configure :zoom, :integer 
    configure :order_no, :integer 
    configure :featured, :boolean 
    configure :published, :boolean
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    configure :deleted_at, :datetime 
    list do
      sort_by :order_no
      field :title
      field :location
      field :reference
      field :bio
      field :description
      field :facilities
      field :price_sale
      field :price_rental
      field :latitude
      field :longitude
      field :zoom
      field :order_no
      field :featured
      field :published
      field :created_at
      field :updated_at
      field :deleted_at
    end
    export do; end
    show do
      field :title
      field :location
      field :reference
      field :bio
      field :description
      field :facilities
      field :price_sale
      field :price_rental
      field :latitude, :map do
        longitude_field :longitude
      end
      field :longitude
      field :zoom
      field :order_no
      field :featured
      field :published
      field :created_at
      field :updated_at
      field :deleted_at
    end
    edit do
      field :title
      field :location
      field :reference
      field :bio
      field :description
      field :facilities
      field :price_sale
      field :price_rental
      field :coordinates, :serialized
      field :latitude, :map do
        longitude_field :longitude
      end
      field :zoom
      field :order_no
      field :featured
      field :published
      field :created_at
      field :updated_at
      field :deleted_at
    end
    create do; end
    update do; end
  end
  
  config.model Photo do
    parent Property
    label 'Property Photo'
    label_plural 'Property Photos'
    weight 2
    configure :property, :belongs_to_association
    configure :title, :string 
    configure :description, :text 
    configure :image, :carrierwave 
    configure :order_no, :integer 
    configure :featured, :boolean 
    configure :published, :boolean 
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    configure :deleted_at, :datetime 
    list do
      sort_by :property, :order_no
      field :property
      field :title
      field :image do
        thumb_method :list
      end
      field :description
      field :order_no
      field :featured
      field :published
      field :created_at, :datetime 
      field :updated_at, :datetime 
      field :deleted_at, :datetime
    end
    export do; end
    show do
      field :property
      field :title
      field :image do
        thumb_method :large
      end
      field :description
      field :order_no
      field :featured
      field :published
    end
    edit do
      field :property
      field :title
      field :image do
        thumb_method :large
      end
      field :description
      field :order_no
      field :featured
      field :published
    end
    create do; end
    update do; end
  end
  
  config.model Member do
    label 'Team Member'
    label_plural 'Team Members'
    weight 3
    configure :_type, :hidden
    configure :_id, :hidden
    configure :name, :string 
    configure :avatar, :carrierwave 
    configure :profile, :text 
    configure :order_no, :integer 
    configure :published, :boolean
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    configure :deleted_at, :datetime 
    list do
      sort_by :order_no
      field :name
      field :avatar
      field :profile
      field :order_no
      field :published
      field :created_at, :datetime 
      field :updated_at, :datetime 
      field :deleted_at, :datetime 
    end
    export do; end
    show do
      field :name
      field :avatar
      field :profile
      field :order_no
      field :published
    end
    edit do
      field :name
      field :avatar
      field :profile
      field :order_no
      field :published
    end
    create do; end
    update do; end
  end
  
  config.model Testimonial do
    weight 4
    configure :_type, :hidden
    configure :_id, :hidden
    configure :name, :string 
    configure :location, :string 
    configure :details, :text 
    configure :order_no, :integer 
    configure :published, :boolean
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    configure :deleted_at, :datetime 
    list do
      field :name
      field :location
      field :details
      field :order_no
      field :published  
    end
    export do; end
    show do
      field :name
      field :location
      field :details
      field :order_no
      field :published  
    end
    edit do
      field :name
      field :location
      field :details
      field :order_no
      field :published  
    end
    create do; end
    update do; end
  end
  
  config.model Amenity do
    navigation_label 'Settings'
    weight 5
    configure :division, :belongs_to_association
    configure :_type, :hidden
    configure :_id, :hidden
    configure :name, :string
    configure :description, :text
    configure :order_no, :integer
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    configure :deleted_at, :datetime 
    list do
      sort_by :division, :name
      field :name
      field :description
      field :division
      field :order_no
    end
    export do; end
    show do
      field :name
      field :description
      field :division
      field :order_no
    end
    edit do; end
    create do
      field :name
      field :description
      field :division
      field :order_no
    end
    update do; end
  end

  config.model Division do
    label 'Amenity Category'
    label_plural 'Amenity Categories'
    parent Amenity
    weight 6
    configure :amenity, :has_many_association
    configure :_type, :hidden
    configure :_id, :hidden
    configure :name, :string
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    configure :deleted_at, :datetime 
    list do
      field :name
      field :amenities
    end
    export do; end
    show do
      field :name
      field :amenities
    end
    edit do
      field :name
      field :amenities
    end
    create do; end
    update do; end
  end
  
  config.model Admin do
    navigation_label 'Members & Administrators'
    weight 7
    configure :_type, :hidden
    configure :_id, :hidden
    configure :username, :string
    configure :email, :string
    configure :password, :password
    configure :password_confirmation, :password
    configure :reset_password_token, :hidden
    configure :reset_password_sent_at, :hidden
    configure :remember_created_at, :hidden
    configure :sign_in_count, :integer
    configure :current_sign_in_at, :datetime
    configure :last_sign_in_at, :datetime
    configure :current_sign_in_ip, :string
    configure :last_sign_in_ip, :string
    list do
      field :username
      field :email
      field :password
      field :password_confirmation
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :current_sign_in_ip
      field :last_sign_in_ip
    end
    export do; end
    show do
      field :username
      field :email
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :current_sign_in_ip
      field :last_sign_in_ip
    end
    edit do
      field :username
      field :email
      field :password
      field :password_confirmation
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :current_sign_in_ip
      field :last_sign_in_ip
    end
    create do
      field :username
      field :email
      field :password
      field :password_confirmation
    end
    update do; end
  end
  
  config.model User do
    navigation_label 'Members & Administrators'
    weight 8
    configure :_type, :hidden
    configure :_id, :hidden
    configure :email, :string
    configure :password, :password
    configure :password_confirmation, :password
    configure :reset_password_token, :hidden
    configure :reset_password_sent_at, :hidden
    configure :remember_created_at, :hidden
    configure :sign_in_count, :integer
    configure :current_sign_in_at, :datetime
    configure :last_sign_in_at, :datetime
    configure :current_sign_in_ip, :string
    configure :last_sign_in_ip, :string
    list do
      field :email
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :current_sign_in_ip
      field :last_sign_in_ip
    end
    export do; end
    show do
      field :email
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :current_sign_in_ip
      field :last_sign_in_ip
    end
    edit do; end
    create do
      field :email
      field :password
      field :password
    end
    update do; end
  end

  # config.model Country do
  #   # Found associations:
  #     configure :properties, :has_many_association   #   # Found columns:
  #     configure :_type, :text         # Hidden 
  #     configure :_id, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :deleted_at, :datetime 
  #     configure :name, :string 
  #     configure :description, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  
  # config.model Interest do
  #   # Found associations:
  #   # Found columns:
  #     configure :_type, :text         # Hidden 
  #     configure :_id, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :deleted_at, :datetime 
  #     configure :name, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  
  # config.model Source do
  #   # Found associations:
  #     configure :supports, :has_many_association   #   # Found columns:
  #     configure :_type, :text         # Hidden 
  #     configure :_id, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :deleted_at, :datetime 
  #     configure :name, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  
  # config.model Support do
  #   # Found associations:
  #     configure :source, :belongs_to_association 
  #     configure :interests, :has_and_belongs_to_many_association   #   # Found columns:
  #     configure :_type, :text         # Hidden 
  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :source_id, :bson_object_id         # Hidden 
  #     configure :interest_ids, :serialized         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end

  # config.model Type do
  #   # Found associations:
  #     configure :properties, :has_many_association   #   # Found columns:
  #     configure :_type, :text         # Hidden 
  #     configure :_id, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :deleted_at, :datetime 
  #     configure :name, :string 
  #     configure :description, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
