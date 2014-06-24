module ApplicationHelper
  def create_delete_icon(object_to_delete, align='')
    link_to "<i class='icon-trash icon-border red-link icon-large #{align} title='Borrar'></i>".html_safe, object_to_delete,
            method: :delete, data: {confirm: "Seguro?"}
  end
  def create_edit_icon(path_to_edit, align='')
    link_to "<i class='icon-edit icon-border blue-link icon-large #{align} title='Editar'></i>".html_safe, path_to_edit
  end

  def create_big_link(icon, title, path)
    link_to "<i class='#{icon} icon-large'>  #{title}</i>".html_safe, path, class: "right dark-link"
  end

end