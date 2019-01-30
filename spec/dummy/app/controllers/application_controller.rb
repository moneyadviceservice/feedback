class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def parent_template
    'layouts/application'
  end
  helper_method :parent_template

  private

  def set_locale
    I18n.locale = params[:locale]
  end
end
