require 'spec_helper'

describe Article do

  let(:user) { FactoryGirl.create(:user) }

  before do
    # This code is not idiomatically correct.
    @article = user.articles.build(title: "Como plantar yesca", description:"Aqui vamos a ver los pasos para plantar yesca", status: 0)
  end

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:author_id) }
  it { should respond_to(:user) }
  it { should respond_to(:status) }

  its(:user) { should eq user }
  it { should be_valid }

  ############ user name ####################################
  describe "when title is not present" do
    before { @article.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @article.title = "a" * 3001 }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @article.author_id = nil }
    it { should_not be_valid }
  end


  describe "when user_id is not present" do
    before { @article.author_id = nil }
    it { should_not be_valid }
  end



end