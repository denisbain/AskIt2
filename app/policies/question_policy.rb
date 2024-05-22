class QuestionPolicy < ApplicationPolicy
  def create?
    user.present?
  end
  def update?

  end
  def destroy?

  end
  def index?
    true
  end

  def show?
    true
  end
end