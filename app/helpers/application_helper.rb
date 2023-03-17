module ApplicationHelper
  def active_if_path_is(path)
    current_page?(path) ? 'text-blue-700' : ''
  end
end
