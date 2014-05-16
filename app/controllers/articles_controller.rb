class ArticlesController< ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :index]

end