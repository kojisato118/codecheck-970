# https://github.com/ruby-grape/grape-swagger-rails
# Readmeには/swagger.josnとあるが、.jsonをつけるとapi自体のjsonが読み込まれなかった
GrapeSwaggerRails.options.url      = '/api/swagger_doc'
GrapeSwaggerRails.options.app_url  = 'http://localhost:3000'
