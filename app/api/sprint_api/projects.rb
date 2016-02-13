module SprintApi
  class Projects < Grape::API
    resource :projects do
      params do
        optional :page, type: Integer, default: 1 , desc: "page"
      end
      desc "return projects in the page"
      get do
        Project.find_projects(page: params[:page])
      end

      desc "create project"
      params do
        requires :title, type: String, desc: "Title"
        requires :description, type: String, desc: "description"
        optional :url, type: String, desc: "url"
      end
      post do
        project = Project.new(title: params[:title],
                                                description: params[:description],
                                                url: params[:url])
        if project.save
          return project
        else
          error!("500 internal server error", 500, [])
        end
      end

      desc "return project by id"
      params do
        requires :id, type: Integer, desc: "Project ID"
      end
      get ":id" do
        project = Project.find_by(id: params[:id])
        if project.present?
          return project
        else
          error!("404 NotFound", 404, [])
        end
      end

      desc "delete project by id"
      params do
        requires :id, type: Integer, desc: "Project ID"
      end
      delete ":id" do
        project = Project.find_by(id: params[:id])
        if project.present?
          if project.destroy
            return project
          else
            error!("500 internal server error", 500, [])
          end
        else
          error!("404 NotFound", 404, [])
        end
      end
    end
  end
end