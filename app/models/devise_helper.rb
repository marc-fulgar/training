module DeviseHelper
  def devise_error_messages!
    return nil unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| "&bull; #{msg}" }.join("<br />")
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
      #{sentence}
      #{messages}
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end