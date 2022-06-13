class IssuePolicy < ApplicationPolicy
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
    user.admin? || record.author == user || record.assigned_to == user

  end

  def create?
    true
  end
end
