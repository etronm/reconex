require 'spec_helper'

describe 'Section pages' do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    let(:section) { FactoryGirl.create(:section) }
    before(:each) do
      sign_in user
      visit sections_path
    end

    it { should have_title(I18n.t(:sections)) }
    it { should have_content('Gracias') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:section) } }
      after(:all) { Section.delete_all }

      it { should have_selector('div.pagination') }

    end

    describe "delete links" do

      it { should_not have_link('Borrar') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit sections_path
        end

        it "should be able to delete another section " do
          Section.paginate(page: 1).each do |section|
            expect(page).to have_link('Borrar', href: section_path(section))
          end
        end

        # it "should be able to delete another section " do
        #   expect do
        #       click_link('Borrar', match: :first)
        #   end.to change(Section, :count).by(-1)
        # end

        it { should_not have_link('Borrar', href: section_path(section)) }
      end
    end
  end
end