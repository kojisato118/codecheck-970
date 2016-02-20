require 'nokogiri'
require 'anemone'

namespace :scraping do
  task :fetch => :environment do
    # TODO: cron
    # TODO: 取得件数とループ
    # TODO: 初回とバッチ時の処理の差

    # 後述。
    opts = {
        depth_limit: 2
    }

    # AnemoneにクロールさせたいURLと設定を指定した上でクローラーを起動！
    Anemone.crawl("http://www.sekiya-lab.info/?page_id=33", opts) do |anemone|
      # 指定したページのあらゆる情報(urlやhtmlなど)をゲットします。
      anemone.on_every_page do |page|
        if page.doc.present?
          # page.docでnokogiriインスタンスを取得し、xpathで欲しい要素(ノード)を絞り込む
          page.doc.xpath("/html/body//div[@class='post-entry']/ul/li").each do |node|
            # FIXME: 汚すぎる
            date = node.children.to_s.match(/\d{4}年\d{1,2}/)
            created_at = nil
            if date.present?
              created_at = Time.zone.parse(date[0].gsub("年", "/"))
            end

            if created_at.nil?
              date = node.children.to_s.match(/(January|February|March|April|May|June|July|August|September|October|November|December) \d{4}/)
              if date.present?
                created_at = Time.zone.parse(date[0])
              end
            end

            if created_at.nil?
              date = node.children.to_s.match(/(Jan.|Feb.|Mar.|Apr.|May|Jun.|Jul.|Aug.|Sep.|Oct.|Nov.|Dec.) \d{4}/)
              if date.present?
                created_at = Time.zone.parse(date[0])
              end
            end

            title_match = node.children.to_s.match(/ : “.*”/)
            title = nil
            if title_match.present?
              title = title_match[0].gsub(" : ","")
            end

            if title.nil?
              title_match = node.children.to_s.match(/  「.*」/)
              if title_match.present?
                title title_match[0].gsub("  ","")
              end
            end

            if title.nil?
              title_match = node.children.to_s.match(/ : 「.*」/)
              if title_match.present?
                title = title_match[0].gsub(" : ","")
              end
            end

            if title.nil?
              title_match = node.children.to_s.match(/ :「.*」/)
              if title_match.present?
                title = title_match[0].gsub(" :","")
              end
            end

            if title.nil?
              title_match = node.children.to_s.match(/,「.*」,/)
              if title_match.present?
                title = title_match[0].gsub(",","")
              end
            end

            if title.present? && created_at.present?
              lab = Lab.find_or_create_by(title: title)
              lab.description = node.children.to_s
              lab.url = "http://www.sekiya-lab.info/?page_id=33"
              lab.image = "http://www.sekiya-lab.info/wp-content/uploads/2013/07/SEKIYA-RUN.jpg"
              lab.created_at = created_at
              lab.tag_list.add("lab")
              lab.save
            end

          end # node終わり
        end
      end # page終わり
    end # Anemone終わり
  end
end
