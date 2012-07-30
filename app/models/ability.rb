class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new # guest user
    
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "subscribed"
      can :manage, [ User, Property, Photo ]
      can :create, Support
    elsif user.role == "registered"
      can :create, [ Subscription, Support ]
    else
      can :create, [ User, Support ]
    end
  end
end
