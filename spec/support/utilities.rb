include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Login"
  end
end

def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end


class ActionView::TestCase::TestController
  def default_url_options(options={})
    { :locale => I18n.default_locale }
  end
end

class ActionDispatch::Routing::RouteSet
  def default_url_options(options={})
    { :locale => I18n.default_locale }
  end
end