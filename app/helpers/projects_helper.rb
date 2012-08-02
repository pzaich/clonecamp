module ProjectsHelper
  def privacy_status(project)
    project.public ? "Public" : "Private"
  end
end
