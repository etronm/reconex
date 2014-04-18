require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signup page" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Login" }

      it { should have_content('Login') }
      it { should have_selector('div.alert.alert-error') }

    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Login"
      end

      it { should have_title(user.name) }
      #it { should have_link('Mi Perfil',     href: user_path(user)) }
      #it { should have_link('Sign out',    href: signout_path) }
      #it { should_not have_link('Login', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Log out" }
        it { should have_link('Login') }
      end
    end


  end
end
