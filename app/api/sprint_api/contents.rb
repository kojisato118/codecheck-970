module SprintApi
  class ContentsEntity < Grape::Entity
    expose :title
    expose :description
    expose :url
    expose :image
    expose :tag_list
  end

  class Contents < Grape::API
    resource :contents do
      params do
        optional :page, type: Integer, default: 1 , desc: "page"
      end
      desc "return contents in the page. contents are combination of projects and qiitas"
      get do
        # 実装してはみたが、この方法だと完全にはprojectsとqiitasを日付でソートできない
        # projectsとqiitaは別Tableにわけておきたいから
        # そういう管理をするTableを用意するか(やりかたはわからない)
        # バッチ処理で定期的にjsonを作ってしまうか
        qiitas = QiitaItem.find_qiita_items(page: params[:page])
        projects = Project.find_projects(page: params[:page])
        lisas = Lisa.find_lisas(page: params[:page])
        labs = Lab.find_labs(page: params[:page])
        contents = qiitas + projects + lisas + labs

        contents.sort! do |a, b|
          a.created_at > b.created_at ? -1 : 1
        end

        present contents, with: ContentsEntity
      end
    end
  end
end