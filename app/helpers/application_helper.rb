module ApplicationHelper

  def display_based_on_public(access_type)
    case access_type
    when :public then public = true
    when :private then public = false
    end
    @projects.select {|project| project.public == public}
  end

end
