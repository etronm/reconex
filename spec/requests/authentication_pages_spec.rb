require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signup page" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button I18n.t(:sign_in) }

      it { should have_content(I18n.t(:new_banner_description)) }
      it { should have_selector('div.alert.alert-error') }

    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in I18n.t(:new_email_label), with: user.email.upcase
        fill_in I18n.t(:new_password_label), with: user.password
        click_button I18n.t(:sign_in)
      end

      it { should have_title(user.name) }
      #it { should have_link('Mi Perfil',     href: user_path(user)) }
      #it { should have_link('Sign out',    href: signout_path) }
      #it { should_not have_link('Login', href: signin_path) }

      describe "followed by signout" do
        before { click_link I18n.t(:sign_out) }
        it { should have_link('Login') }
      end
    end


  end

  describe "authorization" do

    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin, no_capybara: true }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user, no_capybara: true }

      describe "submitting a GET request to the Users#edit action" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match(full_title('Mi Perfil')) }
        specify { expect(response).to redirect_to(root_url) }
      end

      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in I18n.t(:user_form_email), with: user.email.upcase
          fill_in I18n.t(:user_form_password), with: user.password
          click_button I18n.t(:sign_in)
        end

        describe "after signing in" do
          it "should render the desired protected page" do
            expect(page).to have_title(I18n.t(:user_title))
          end
        end
      end

      describe "in the Articles controller" do

        describe "submitting to the create action" do
          before { post articles_path }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "submitting to the destroy action" do
          before { delete article_path(FactoryGirl.create(:article)) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title(I18n.t(:sign_in)) }
        end

        describe "visiting the user index" do
          before { visit users_path }
          it { should have_title(I18n.t(:sign_in)) }
        end

        describe "submitting to the update action" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end
    end
  end

end
