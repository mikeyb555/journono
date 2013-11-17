require 'journono/page_fetcher'

class Article
  include Dynamoid::Document

  field :title
  field :published, :datetime
  field :url
  field :rating, :integer
  field :analysed, :boolean

  belongs_to :site

  def analyse
    fetch = Journono::PageFetcher.new(self.url)
    fetch.get_content_body(self.site.content_container)

  end


end
