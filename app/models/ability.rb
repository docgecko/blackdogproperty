class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new # guest user
    
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :subscribed
      can :show, :subscription
      can :index, :dashboard
      can :edit, :account
      can :edit, :property
      can [:edit, :update, :check_email, :check_username], :account
      can [:index, :edit, :update, :new, :create, :destroy, :preview], :property
    elsif user.role? :registered
      can :new, :subscription
    else
      cannot :manage, :all
    end
        
    # if user_role == "admin"
    #   can :manage, :all
    # elsif user_role == "registered"
    #   # can :manage, :all
    #   can :new, :subscription
    # elsif user_role == "subscribed"
    #   can :manage, :all
    #   # can :show, :subscription
    #   # can :index, :dashboard
    #   # can :edit, :account
    #   # can :edit, :property
    #   # can [:edit, :update, :check_email, :check_username], :account
    #   # can [:index, :edit, :update, :new, :create, :destroy, :preview], :property
    # end
  end
end
