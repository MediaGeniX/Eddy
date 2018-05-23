class Hr::ReportPolicy < ApplicationPolicy

  def can?
    user.admin
  end

  def new?
    can?
  end

  def create?
    can?
  end

end