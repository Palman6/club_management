# frozen_string_literal: true

# This is overall application controller base class
class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!
end
