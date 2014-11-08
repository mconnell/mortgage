module ApplicationHelper

  def td_with_colour(amount, index)
    return "<td>".html_safe if params[:rent].blank?

    rent = params[:rent].to_i

    css_class = if amount < rent
      "success"
    elsif amount < (rent + 150)
      "warning"
    else
      "danger"
    end

    css_class << " twenty-five" if index == 3

    "<td class=\"#{css_class}\">".html_safe
  end

end
