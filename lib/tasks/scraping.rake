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
          page.doc.xpath("/html/body//div[@class='post-entry']").each do |node|
            puts node
          end # node終わり
        end
      end # page終わり
    end # Anemone終わり
  end
end
