class ProjectsController < ApplicationController
  def index
    @images = []
    for i in 0..10
      @images.append("https://avatars3.githubusercontent.com/u/4058115?v=3&s=460")
    end
  end

  def show
  end
end
