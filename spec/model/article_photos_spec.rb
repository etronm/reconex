require 'spec_helper'

describe ArticlePhotos do
  let(:user) { FactoryGirl.create(:user) }
  let(:article) { user.articles.build(title: "Lorem ipsum", description: "description", status: 0) }
  let(:section) { FactoryGirl.create(:section) }
  #let(:article_contents) { ArticleContents.new(article_id: article.id, section_id: section.id, description: "descr", status: 0, display_order: 1) }

  before do
    @article_photos = ArticlePhotos.new(article: article, section: section,
                                        photo_path: 'http://imgs.steps.dragoart.com/how-to-draw-a-hummingbird-and-flower-step-4_1_000000130797_5.gif',
                                        album_url: '', photo_content: '')
  end

  subject { @article_photos }

  it { should respond_to(:photo_path) }
  it { should respond_to(:album_url) }
  it { should respond_to(:photo_content) }

  it { should be_valid }

  describe "when photo_path is not present" do
    before {
      @article_photos.photo_path = ""
      @article_photos.photo_content = ""
      @article_photos.album_url = ""
    }
    it { should_not be_valid }
  end



end
