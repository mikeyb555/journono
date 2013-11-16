module Journono
  module TargetModule
    class RSSModule

      def get_new_articles (url, last_scan)
        return_array = Array.new
        feed = Feedzirra::Feed.fetch_and_parse(url)
        feed.entries.each do |article|
          article_date = article.published
          if article_date < last_scan
            next
          end
          article_model = Article.new
          article_model.title = article.title.sanitize
          article_model.url = article.url
          article_model.published = article.published
          return_array.append article_model
        end
        return return_array
      end

    end
  end
end