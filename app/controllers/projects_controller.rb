class ProjectsController < ApplicationController
  before_action :sign_in_required, only: [:new]
  def index

  end

  def show
  end

  def new
    # TODO: 何かしら認証かける
  end
end
