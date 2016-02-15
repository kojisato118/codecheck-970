class ProjectsController < ApplicationController
  def index

  end

  def show
  end

  def new
    # TODO: 何かしら認証かける
  end

  def create
    # TODO: ここだけじゃなくurlとか見たいなlocalhostとproductionとかでわけたい定数の設定
    con = Faraday::Connection.new(:url => 'http://sprint-koji.herokuapp.com/')
    response = con.post '/api/projects', params
    # TODO: エラーや成功についてアラートする
    if response.status == 201
      redirect_to "/"
    else
      redirect_to "/projects/new"
    end
  end
end
