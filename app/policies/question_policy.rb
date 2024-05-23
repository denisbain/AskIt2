class QuestionPolicy < ApplicationPolicy
  def create?
    !user.quest?
  end
  def update?
    user.admin_role? || user.moderator_role? || user.author?(record)
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