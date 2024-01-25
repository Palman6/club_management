# frozen_string_literal: true

# EventPolicy
class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true if user.admin?
  end

  def edit?
    true if user.admin?
  end

  def update?
    true if user.admin?
  end

  def destroy?
    user.admin?
  end

  def execute
    true
  end
end
