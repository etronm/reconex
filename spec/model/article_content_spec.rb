require 'spec_helper'

describe ArticleContents do

  let(:user) { FactoryGirl.create(:user) }
  let(:article) { user.articles.build(title: "Lorem ipsum", description: "description", status: 0) }
  let(:section) { FactoryGirl.create(:section) }

  before do
    #@article_contents = ArticleContents.new(article_id: article.id, section_id: section.id, description: "descr", status: 0, display_order: 1)
    @article_contents = ArticleContents.new(article: article, section: section, description: "descr", status: 0, display_order: 1)
  end

  subject { @article_contents }

  it { should respond_to(:description) }
  it { should respond_to(:status) }
  it { should respond_to(:display_order) }

  it { should be_valid }

  ###########################
  ############ user name ####################################
  describe "when description is not present" do
    before { @article_contents.description = " " }
    it { should_not be_valid }
  end

  describe "when description  is too long" do
    before { @article_contents.description = "a" * 3001 }
    it { should_not be_valid }
  end

  describe "when article is not present" do
    before { @article_contents.article = nil }
    it { should_not be_valid }
  end

  describe "when section is not present" do
    before { @article_contents.section = nil }
    it { should_not be_valid }
  end

  describe "when display order is not present" do
    before { @article_contents.display_order = nil }
    it { should_not be_valid }
  end

  describe "when status order is not present" do
    before { @article_contents.status = nil }
    it { should_not be_valid }
  end
end