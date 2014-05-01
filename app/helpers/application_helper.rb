module ApplicationHelper
  def create_delete_icon(object_to_delete)
    link_to '<i class="icon-trash icon-large" title="Borrar"></i>'.html_safe, object_to_delete,
            method: :delete, data: {confirm: "Seguro?"}, class: "right dark-link"
  end

  def create_big_link(icon, title, path)
    link_to "<i class='#{icon} icon-large'>  #{title}</i>".html_safe, path, class: "right dark-link"
  end


end
