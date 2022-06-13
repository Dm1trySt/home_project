class ProjectPolicy < ApplicationPolicy
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
    user.admin? || user.author?(record)
  end

  def create?
    true
  end
end
