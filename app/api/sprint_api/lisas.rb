module SprintApi
  class LisasEntity < Grape::Entity
    expose :id
    expose :lisa_id
    expose :title
    expose :description
    expose :url
    expose :image
    expose :tag_list
  end

  class Lisas < Grape::API
    resource :lisas do
      params do
        optional :page, type: Integer, default: 1 , desc: "page"
      end
      desc "return lisas in the page"
      get do
        lisas = Lisa.find_lisas(page: params[:page])
        present lisas, with: LisasEntity
      end

      desc "return lisa by id"
      params do
        requires :id, type: Integer, desc: "lisa ID"
      end
      get ":id" do
        lisa = Lisa.find_by(id: params[:id])
        if lisa.present?
          return present lisa , with: LisasEntity
        else
          error!("404 NotFound", 404, [])
        end
      end
    end
  end
end