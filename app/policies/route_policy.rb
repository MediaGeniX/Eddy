class RoutePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where(:user => user)
    end
  end

  def create?
    user == record.user
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end

  def update?
    create?
  end

end
