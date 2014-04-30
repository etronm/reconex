require 'spec_helper'

describe Article do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    #@article =  Article.new(title: "Lorem ipsum", description:"description", author_id: user.id, status: 0)
    @article = user.articles.build(title: "Lorem ipsum", description:"description", status: 0)
  end

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:author_id) }
  it { should respond_to(:user) }
  it { should respond_to(:status) }

  its(:user) { should eq user }


  it { should be_valid }

  describe "when user_id is not present" do
    before { @article.author_id = nil }
    it { should_not be_valid }
  end
end