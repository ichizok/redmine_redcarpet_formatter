module RedcarpetFormatter
  class PygmentsStylesheetHook < Redmine::Hook::ViewListener
    render_on :view_layouts_base_html_head, :inline => "<%= stylesheet_link_tag 'highlight', :plugin => 'redmine_redcarpet_formatter' %>"
  end
end
