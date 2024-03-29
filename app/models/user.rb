class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable,
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  ## Database authenticatable
  field :email,                   :type => String,    :null => false,     :default => ""
  field :encrypted_password,      :type => String,    :null => false,     :default => ""

  ## Recoverable
  field :reset_password_token,    :type => String
  field :reset_password_sent_at,  :type => Time

  ## Rememberable
  field :remember_created_at,     :type => Time

  ## Trackable
  field :sign_in_count,           :type => Integer,   :default => 0
  field :current_sign_in_at,      :type => Time
  field :last_sign_in_at,         :type => Time
  field :current_sign_in_ip,      :type => String
  field :last_sign_in_ip,         :type => String
                                  
  ## Confirmable                  
  field :confirmation_token,      :type => String
  field :confirmed_at,            :type => Time
  field :confirmation_sent_at,    :type => Time
  field :unconfirmed_email,       :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts,         :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,            :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,               :type => Time

  ## Token authenticatable
  # field :authentication_token,    :type => String
  
  # Additional fields
  field :first_name,              :type => String
  field :last_name,               :type => String
  field :username,                :type => String
  field :receive_newsletter,      :type => Boolean
  field :telephone,               :type => String
  # field :role,                    :type => Array,     :default => "guest"
  
  # Setup accessible (or protected) attributes
  attr_accessor :login
  
  # Validations
  validates_presence_of :first_name, :last_name, :username
  validates_uniqueness_of :username
  validates_format_of :username, :with => /\A[A-Za-z0-9_-]+\z/
  validates_length_of :username, minimum: 3, maximum: 16, 
                                 too_long: "is too long (maximum length 16 characters)",
                                 too_short: "is too short (minimum length 3 characters)"
  
  # References
  has_many :properties
  embeds_many :subscriptions
  accepts_nested_attributes_for :subscriptions
  
  # Roles
  def role?(role)
    today = Date.today
    subscriptions = self.subscriptions.all
    count = subscriptions.count.to_i
    case count
      when 0
        return role == :registered
      else
        subscriptions.each do |subscription|
          sub_start = subscription.start_date
          sub_end = subscription.end_date
          if sub_start <= today && sub_end >= today
            return role == :subscribed
          else
            return role == :registered
          end
        end
    end
  end
  
  # Use username instead of id
  def to_param
    username
  end
  
  # Allow username and email to be used as login
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      self.any_of({ :username =>  /^#{Regexp.escape(login)}$/i }, { :email =>  /^#{Regexp.escape(login)}$/i }).first
    else
      super
    end
  end

end
