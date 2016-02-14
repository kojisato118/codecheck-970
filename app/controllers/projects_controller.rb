class ProjectsController < ApplicationController
  def index
    @projects = Project.find_projects
  end

  def show
  end
end
