class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    alias_action :new, :create, :read, :update, :destroy, :to => :crud

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    can :manage, Location, user_id:  user.id

    cannot :destroy, Location do |location|
      not (user.routes.where(from: location).empty? and
           user.routes.where(to: location).empty?)
    end

    can :manage, Route, user_id:  user.id
  end
end
