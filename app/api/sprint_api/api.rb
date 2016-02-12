module SprintApi
  class API < Grape::API
    prefix "api"
    format :json

    mount SprintApi::Projects
  end
end