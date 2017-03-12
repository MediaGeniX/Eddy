class TripPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where(:user => user)
    end
  end

  def create?
    user == record.user
  end

  def create_from_route?
    create?
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

  def copy_to_next_working_day?
    create?
  end

  def copy_to_today?
    create?
  end

  def copy_to_same_day?
    create?
  end

end
