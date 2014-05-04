require 'spec_helper'

describe ArticleContents do

  let(:user) { FactoryGirl.create(:user) }
  let(:article) { user.articles.build(title: "Lorem ipsum", description: "description", status: 0) }
  let(:section) { FactoryGirl.create(:section) }

  before do
    @article_contents = ArticleContents.new(article_id: article.id, section_id: section.id, description: "descr", status: 0, display_order: 1)
  end

  subject { @article_contents }

  it { should respond_to(:description) }
  it { should respond_to(:status) }
  it { should respond_to(:display_order) }

end