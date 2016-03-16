class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    alias_action :new, :create, :read, :update, :destroy, :to => :crud

    if user.admin?
      can :manage, :all
    end

    can :manage, Trip, user_id:  user.id
    can :manage, Route, user_id:  user.id
  end
end
