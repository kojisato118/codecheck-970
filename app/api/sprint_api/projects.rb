module SprintApi
  class ProjectsEntity < Grape::Entity
    expose :id
    expose :title
    expose :description
    expose :url
    expose :image
    expose :tag_list
  end

  class Projects < Grape::API
    resource :projects do
      params do
        optional :page, type: Integer, default: 1 , desc: "page"
        optional :per, type: Integer, default: 16 , desc: "per page"
      end
      desc "return projects in the page"
      get do
        projects = Project.find_projects(page: params[:page], per: params[:per])
        present projects, with: ProjectsEntity
      end

      desc "create project"
      params do
        requires :title, type: String, desc: "Title"
        requires :description, type: String, desc: "description"
        optional :url, type: String, desc: "url"
        optional :image, type: ActionDispatch::Http::UploadedFile, desc: "uploaded image file"
      end
      post do
        project = Project.new(title: params[:title],
                              description: params[:description],
                              url: params[:url])
        if(params[:image].present?)
          image = ActionDispatch::Http::UploadedFile.new(params[:image])
          project.image = image
        end

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
          return present project, with: ProjectsEntity
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