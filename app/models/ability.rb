class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.admin?
      can :manage, :all
    end

    can :manage, User, id: user.id
    can :manage, Trip, user_id:  user.id
    can :manage, Route, user_id:  user.id
  end
end
