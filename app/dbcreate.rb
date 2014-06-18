=begin

=end
# users
#
rails generate model User email:string name:string phone:string password:string user_type:integer
# user = User.new(name: 'enrique', email: 'et@gg.com')

--- validar si user tiene un numero int para utilizarlo como key

Section name:string description:string

Article title:string description:string status:int author_id:int date_published:date comments_enabled:boolean  featured:boolean views:int
	
ArticleSection id:int article_id:int section_id:int description:string status:int
ArticleCategory category_id:int article_id:int 
ArticleTag id:int article_id:int tag:string tag_clean;string
ArticleRelated article_id:int article_related_id:int

rails generate model ArticlePhotos article_id:integer section_id:integer photo_path:string album_url:string photo_content:string

Comment id:int article_id:int section_id:int user_id:int comment:string status:int is_reply_to_id:int date_posted:date
CommentUser id:int user_id:int name:string email:string website:string

Attribute id:int name:string
Category id:int name:string name_clean:string ^^description:string ^^information:string status:int
CategoryAttribute id:int category_id:int attribute_id:int


######################################################################################################################
# PARA RECREAR LA BASE DE DATOS
######################################################################################################################
rake db:drop
rake db:create
rake db:migrate
rake db:populate
######################################################################################################################
######################################################################################################################

http://0.0.0.0:3000/en/article_contents/new?article_id=302
