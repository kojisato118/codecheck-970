namespace :lisa do
  task :fetch => :environment do
    # TODO: cron
    # TODO: 取得件数とループ
    # TODO: 初回とバッチ時の処理の差
    lisa_url = "http://www.lxixsxa.com/"
    sony_url = 'http://www.sonymusic.co.jp'
    con = Faraday::Connection.new(:url => sony_url)
    response = con.get "/json/v2/artist/lisa/information/start/0/count/20"
    body = JSON.parse(response.body.match(/callback\((.*)\)/)[1])
    body["items"].reverse_each do |item|
      lisa_id = item["id"]
      lisa = Lisa.find_or_initialize_by(lisa_id: lisa_id)
      lisa.title = item["title"]
      lisa.description = item["article"]
      lisa.url = lisa_url + item["link"]
      lisa.created_at = Time.zone.parse(item["date"])

      if item["images"]["image"].present?
        # ぱっと見なかったからどうなるかはわかんない
        lisa.image = lisa_url + item["images"]["image"]
      else
        lisa.image = "http://www.lxixsxa.com/img/top/bg/info.jpg"
      end

      unless lisa.save
        # TODO エラー処理
      end
    end
  end
end
