class Hr::UserPolicy < ApplicationPolicy

  def index?
    show?
  end

  def show?
    user.admin
  end

  def edit?
    show?
  end

  def update?
    show?
  end

end