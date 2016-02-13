class ProjectsController < ApplicationController
  def index
    @projects = Project.find_projects
  end

  def show
  end

  # jsでapiを叩いて取得したデータをrails側に渡すため
  # あまりきれいじゃない
  # データバインディングされるjsフレームワーク使うべきかなあ
  def set_projects
    @projects = params[:projects]
  end
end
