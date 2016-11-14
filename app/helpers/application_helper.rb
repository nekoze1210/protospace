module ApplicationHelper
  def active_class_for(name)
    "active" if  name == params[:controller]
  end
end
