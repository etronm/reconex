require 'spec_helper'

describe 'Article Contents pages/' do

  subject { page }

  describe "create a complete article/ " do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit new_article_path
    end

    it { should have_title(I18n.t(:article_new_title)) }

    describe "creating the article header/ " do
      before do
        fill_in I18n.t(:article_form_title), with: Faker::Lorem.sentence(5)
        fill_in I18n.t(:article_form_description), with: Faker::Lorem.sentence(10)
        click_button I18n.t(:article_create_sections)
      end

      describe "after create an article/ " do
        it "should render the contents page/ " do
          expect(page).to have_title(I18n.t(:article_create_new_section))
        end
      end

    end


  end
end