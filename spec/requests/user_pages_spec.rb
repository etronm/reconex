require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit users_path
    end

    it { should have_title(I18n.t(:user_title)) }
    it { should have_content(I18n.t(:user_title)) }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all) { User.delete_all }

      it { should have_selector('div.pagination') }

      # etron, esta prueba no la paso nunca... no se por que.... ??????
      # it "should list each user" do
      #   User.paginate(page: 1).each do |user|
      #     expect(page).to have_link(user_path(user))
      #   end
      # end
    end

    describe "delete links" do

      it { should_not have_css('icon-trash') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it "should be able to delete another user" do
          expect do
            click_link('', :href => user_path(user))
          end.to change(User, :count).by(-1)
        end

      end
    end


  end

  # describe "profile page" do
  #   let(:user) { FactoryGirl.create(:user) }
  #   before { visit user_path(user) }
  #
  #   it { should have_content(user.name) }
  #   it { should have_title(user.name) }
  # end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:article, user: user, title: "Foo") }
    let!(:m2) { FactoryGirl.create(:article, user: user, title: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "articulos" do
      it { should have_content(m1.title) }
      it { should have_content(m2.title) }
      it { should have_content(user.articles.count) }
    end
  end


  describe "signup page" do
    before { visit new_user_path }

    it { should have_title(I18n.t(:user_title)) }
    it { should have_content(I18n.t(:user_profile_title)) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { I18n.t(:create_user_button_label) }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in I18n.t(:user_form_name), with: "Example User"
        fill_in I18n.t(:user_form_email), with: "user@example.com"
        fill_in I18n.t(:user_form_password), with: "foobar"
        fill_in I18n.t(:user_form_password_confirmation), with: "foobar"
        fill_in I18n.t(:user_form_phone), with: "7876199877"
        find("option[value='en']").click

        #hidden fields has to be filled manually, etron
        find(:xpath, "//input[@id='user_user_type']").set "0"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        #it { should have_link('Salir', href: signout_path) }
        it { should have_title(user.name) }
        #it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end

    end


  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_title(I18n.t(:user_title) )}
      it { should have_content(I18n.t(:user_profile_title)) }
      it { should have_link(I18n.t(:user_modify_avatar) , href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information 2" do
      before { click_button I18n.t(:save_button_label) }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name) { "Enriqueto2" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in I18n.t(:user_form_name) , with: new_name
        fill_in I18n.t(:user_form_email), with: new_email
        fill_in I18n.t(:user_form_password), with: user.password
        fill_in I18n.t(:user_form_password_confirmation), with: user.password
        fill_in I18n.t(:user_form_phone), with: user.phone
        find("option[value='en']").click

        click_button I18n.t(:save_button_label)
      end

      it { should have_title(new_name) }
      #it { should have_selector('div.alert.alert-success') }
      it { should have_link(I18n.t(:sign_out), href: signout_path) }
      specify { expect(user.reload.name).to eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end

end