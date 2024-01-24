# frozen_string_literal: true

class AttendingPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true if user.admin?
  end

  def show?
    true if user.admin?
  end

  def destroy?
    true if current_user || user.admin?
  end
end
