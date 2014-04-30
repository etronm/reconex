class ArticleSection < ActiveRecord::Base
  belongs_to :article, validate: true
  belongs_to :section, validate: true

end
