require 'spec_helper'

describe ArticleContent do

  let(:user) { FactoryGirl.create(:user) }
  let(:article) { user.articles.build(title: "Lorem ipsum", description: "description", status: 0) }
  let(:section) { FactoryGirl.create(:section) }

  before do
    #@article_contents = ArticleContent.new(article_id: article.id, section_id: section.id, description: "descr", status: 0, display_order: 1)
    @article_content = ArticleContent.new(article: article, section: section, description: "descr", status: 0, display_order: 1)
  end

  subject { @article_content }

  it { should respond_to(:description) }
  it { should respond_to(:status) }
  it { should respond_to(:display_order) }

  it { should be_valid }

  ###########################
  ############ user name ####################################
  describe "when description is not present" do
    before { @article_content.description = " " }
    it { should_not be_valid }
  end

  describe "when description  is too long" do
    before { @article_content.description = "a" * 3001 }
    it { should_not be_valid }
  end

  describe "when article is not present" do
    before { @article_content.article = nil }
    it { should_not be_valid }
  end

  describe "when section is not present" do
    before { @article_content.section = nil }
    it { should_not be_valid }
  end

  describe "when display order is not present" do
    before { @article_content.display_order = nil }
    it { should_not be_valid }
  end

  describe "when status order is not present" do
    before { @article_content.status = nil }
    it { should_not be_valid }
  end
end