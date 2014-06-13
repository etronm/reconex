require 'spec_helper'

describe Articles do

  subject { page }

  describe "validando articulos del usuario" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit articles_path
    end

    it { should have_title(I18n.t(:articles)) }
    it { should have_content('Mariposa') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:article) } }
      after(:all) { Article.delete_all }

      it { should have_selector('ul.pagination') }

    end
  end
end
