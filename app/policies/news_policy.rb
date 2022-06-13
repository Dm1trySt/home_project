class NewsPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    user.admin? || user.author?(record)
  end

  def update?
    user.admin? || user.author?(record)
  end

  def create?
    true
  end
end
