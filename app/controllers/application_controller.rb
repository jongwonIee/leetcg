class ApplicationController < ActionController::Base
  before_action :set_action_cable_identifier
  include Pagy::Backend
  include ApplicationHelper

  private
  def set_action_cable_identifier
    cookies.encrypted[:author_id] = current_author&.id
  end
end