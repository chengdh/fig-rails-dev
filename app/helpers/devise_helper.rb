#coding: utf-8
module DeviseHelper
  def devise_error_messages!
    html = ""
    flash.each do |name, msg|
      html += <<-HTML
        <div class="alert alert-error alert-danger">
          #{msg}
        </div>
      HTML
    end

    html.html_safe
  end
end
