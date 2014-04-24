module MainHelper
  def display_feature(icon, header, content, reference)

    p "<div class='small-12 large-3 columns aligncenter features-box'><div class='features-img aligncenter'><i class='#{icon}  icon-circled icon-64'></i></div><div class='features-details'><h4>#{header}</h4><p>#{content}</p><a href='#{reference}'>Read more</a></div></div>"

  end
end