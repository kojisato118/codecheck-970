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
        optional :per, type: Integer, default: 16 , desc: "per page"
      end
      desc "return contents in the page. contents are combination of projects and qiitas"
      get do
        # FIXME:
        # 実装してはみたが、この方法だと完全にはprojectsとqiitasを日付でソートできない
        # projectsとqiitaは別Tableにわけておきたいから
        # そういう管理をするTableを用意するか(やりかたはわからない)
        # バッチ処理で定期的にjsonを作ってしまうか

        per = params[:per]/4

        qiitas = QiitaItem.find_qiita_items(page: params[:page], per: per)
        lisas = Lisa.find_lisas(page: params[:page], per: per)
        labs = Lab.find_labs(page: params[:page], per: per)

        #projectsは優先度低めで、per%4のあまり。あまりがない時はper/4の枚数
        if params[:per]%4 != 0
          projects = Project.find_projects(page: params[:page], per: params[:per]%4)
        else
          projects = Project.find_projects(page: params[:page], per: per)
        end

        contents = qiitas + lisas + labs+ projects

        #contents全体でのcreated_atによるソート
        contents.sort! do |a, b|
          a.created_at > b.created_at ? -1 : 1
        end

        present contents, with: ContentsEntity
      end
    end
  end
end