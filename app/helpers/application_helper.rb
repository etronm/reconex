module ApplicationHelper
  def create_delete_icon(object_to_delete)
    link_to '<i class="icon-trash icon-border pull-right red-link " title="Borrar"></i>'.html_safe, object_to_delete,
            method: :delete, data: {confirm: "Seguro?"}

    # link_to object_to_delete, :class => 'tiny btn-style-3 button right ' do
    #   "<i class='icon-trash icon-large' title='Borrar'></i>".html_safe
    # end
  end

  def create_big_link(icon, title, path)
    link_to "<i class='#{icon} icon-large'>  #{title}</i>".html_safe, path, class: "right dark-link"
  end

end
