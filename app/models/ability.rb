class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    
    if user.admin?
      can :manage, :all
    else
      cannot :manage, [ Member, Testimonial, User ]
      can :manage, Property
      can [ :edit, :destroy, :check_email ], User
    end
  end
end
