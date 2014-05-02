class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include MainHelper

  before_action :set_locale
 
def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

def extract_locale_from_tld
  parsed_locale = request.host.split('.').last
  I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
end

end
