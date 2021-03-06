# frozen_string_literal: true

module ApplicationHelper
  require 'uri'
  def error_messages(instance, column)
    message_index = instance.errors.details.find_index { |key, _value| key == column.to_sym }
    return if message_index.nil?

    message = instance.errors.full_messages[message_index]
    html = ''
    html += <<-HTML
    <div class="alert alert-warning alert-dismissible mt-1" role="alert">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
        <span class="sr-only">close</span>
      </button>
      #{message}
    </div>
    HTML
    html.html_safe
  end

  def set_default_avatar(user)
    if user.gender == 'male'
      'kuma.png'
    elsif user.gender == 'female'
      'hitsuji.png'
    elsif user.gender == 'other'
      'lion.png'
    else
      'niwatori.png'
    end
  end

  def text_url_to_link(text)
    URI.extract(text, %w[http https]).uniq.each do |url|
      sub_text = ''
      sub_text << '<a href=' << url << ' target="_blank">' << url << '</a>'

      text.gsub!(url, sub_text)
    end

    text
  end
end
