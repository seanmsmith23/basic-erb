require "erb_generator"

class HTMLGenerator < ERBGenerator

  def initialize(input=nil)
    @given = input
  end

  def section(text)
    template = "<section><%= content %></section>"
    options_hash = {:locals => {:content => text}, :layout => @given}
    erb(template, options_hash)
  end

  def unordered_list(array_of_items)
    template = <<-TEMPLATE
    <ul>
    <% content.each do |item| %>
      <li><%= item %></li>
    <% end %>
    </ul>
    TEMPLATE
    options_hash = {:locals => {:content => array_of_items}, :layout => @given}
    erb(template, options_hash)
  end

  def button(button_text, class_attribute = nil)
    template = "<%= button_class %><%= content %></button>"


    if class_attribute != nil
      class_name = "<button class='#{class_attribute.values[0]}'>"
    else
      class_name = "<button>"
    end

    options_hash = {:locals => {:content => button_text,
                                :button_class => class_name,}, :layout => @given}

    erb(template, options_hash)
  end
f
end