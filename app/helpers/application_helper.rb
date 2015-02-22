module ApplicationHelper

  def bootstrap_label_helper(label_name, label_variation)
    return "<span class=\"label label-#{label_variation}\">#{label_name}</span>".html_safe
  end

  def boolean_to_words(value)
    value ? "Yes" : "No"
  end
end
