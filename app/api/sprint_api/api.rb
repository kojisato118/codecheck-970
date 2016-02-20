require 'grape'
require 'grape-swagger'

module SprintApi
  class API < Grape::API
    prefix "api"
    format :json

    mount SprintApi::Projects
    mount SprintApi::Qiitas
    mount SprintApi::Contents
    mount SprintApi::Lisas
    mount SprintApi::Labs
    mount SprintApi::Sandbox

    add_swagger_documentation
  end
end