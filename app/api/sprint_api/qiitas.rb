module SprintApi
  class QiitasEntity < Grape::Entity
    expose :id
    expose :qiita_item_id
    expose :title
    expose :description
    expose :url
    expose :image
  end

  class Qiitas < Grape::API
    resource :qiitas do
      params do
        optional :page, type: Integer, default: 1 , desc: "page"
      end
      desc "return qiitas in the page"
      get do
        qiitas = QiitaItem.find_qiita_items(page: params[:page])
        present qiitas, with: QiitasEntity
      end

      desc "return qiita by id"
      params do
        requires :id, type: Integer, desc: "Project ID"
      end
      get ":id" do
        qiita = QiitaItem.find_by(id: params[:id])
        if qiita.present?
          return present qiita , with: QiitasEntity
        else
          error!("404 NotFound", 404, [])
        end
      end
    end
  end
end