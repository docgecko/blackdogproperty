class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :subscribed
      can :index, :dashboard
      can [:edit, :update, :check_email, :check_username], :account
      can [:manage, :preview], :property
      can :manage, Photo
    elsif user.role? :registered
      can [:new, :create], :subscription
    else
      cannot :manage, :all
    end
  end
end
