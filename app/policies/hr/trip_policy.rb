class Hr::TripPolicy < ApplicationPolicy

  def report?
    user.admin
  end

end