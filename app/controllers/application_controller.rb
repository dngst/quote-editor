require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :authenticate_user!, unless: :devise_controller?

  private

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end

  helper_method :current_company
end
