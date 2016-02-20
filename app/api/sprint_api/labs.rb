module SprintApi
  class LabsEntity < Grape::Entity
    expose :id
    expose :title
    expose :description
    expose :url
    expose :image
    expose :tag_list
  end

  class Labs < Grape::API
    resource :labs do
      params do
        optional :page, type: Integer, default: 1 , desc: "page"
      end
      desc "return labs in the page"
      get do
        labs = Lab.find_labs(page: params[:page])
        present labs, with: LabsEntity
      end

      desc "return lab by id"
      params do
        requires :id, type: Integer, desc: "lab ID"
      end
      get ":id" do
        lab = Lab.find_by(id: params[:id])
        if lab.present?
          return present lab , with: LabsEntity
        else
          error!("404 NotFound", 404, [])
        end
      end
    end
  end
end