class UserPolicy < ApplicationPolicy

  def create?
    show?
  end

  def index?
    show?
  end

  def show?
    user.id == record.id
  end

  def update?
    show?
  end

  def edit?
    show?
  end


end
