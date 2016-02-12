module SprintApi
  class Projects < Grape::API
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
      get do
        error!("BadRequest", 400)
      end
    end
  end
end