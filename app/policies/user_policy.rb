# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    true if user.present? && (user.admin? || record == user)
  end

  def my_profile?
    true
  end

  def destroy?
    user.present? && user.admin?
  end
end
