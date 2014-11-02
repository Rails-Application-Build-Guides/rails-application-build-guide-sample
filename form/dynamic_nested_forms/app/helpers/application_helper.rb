module ApplicationHelper
  def navlink(title, path, current_controller, current_action)
    css_klass = ""
    if params[:controller] == current_controller.to_s && current_action.include?(params[:action].to_sym)
      css_klass = "active"
    end
    content_tag :li, class: css_klass do
      link_to title, path
    end
  end
end
