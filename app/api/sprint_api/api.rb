module SprintApi
  class API < Grape::API
    prefix "api"
    format :json

    mount SprintApi::Projects
    mount SprintApi::Sandbox
  end
end