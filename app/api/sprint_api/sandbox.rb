module SprintApi
  class Sandbox < Grape::API
    resource :ping do
      get do
        "PONG"
      end
    end
    resource :notfound do
      get do
        error!("NotFound", 404)
      end
    end
    resource :badrequest do
      post do
        error!("BadRequest", 400)
      end
    end
  end
end