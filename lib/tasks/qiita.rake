namespace :qiita do
  task :fetch => :environment do
    # TODO: cron
    # TODO: 取得件数とループ
    # TODO: 初回とバッチ時の処理の差
    con = Faraday::Connection.new(:url => 'http://qiita.com')
    response = con.get '/api/v2/users/kojisato118/items'
    body = JSON.parse(response.body)
    body.reverse_each do |item|
      qiita_item_id = item["id"]

      qiita_item = QiitaItem.find_or_initialize_by(qiita_item_id: qiita_item_id)
      qiita_item.title = item["title"]
      qiita_item.description = item["rendered_body"]
      qiita_item.url = item["url"]
      qiita_item.created_at = Time.zone.parse(item["created_at"])

      image_match = qiita_item.description.match(/<img.+src="(.*(png|jpg|jpeg|gif))".*>/)
      if image_match.present?
        qiita_item.image = image_match[1]
      else
        qiita_item.image = "/images/medium/no_image.png"
      end

      qiita_item.tag_list.add("qiita")

      unless qiita_item.save
        # TODO: エラー処理
      end
    end
  end
end
