module ApplicationHelper
  def flash_class(level)
    case level
        when "warning" then "notification is-warning"
        when "success" then "notification is-success"
        when "info" then "notification is-info"
    end
  end
end
