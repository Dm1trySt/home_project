class RolePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    user.admin?
  end

  def update?
    user.admin?
  end

  def create?
    user.admin?
  end
end
