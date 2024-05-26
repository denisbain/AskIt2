class UserPolicy < ApplicationPolicy
  def create?
    user.quest?
  end
  def update?
    record == user
  end

  def index?
    false
  end

  def show?
    true
  end

  def destroy?
    false
  end
end