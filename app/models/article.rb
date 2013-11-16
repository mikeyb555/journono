class Article
  include Dynamoid::Document

  field :title
  field :published, :datetime
  field :url
  field :rating, :integer
  belongs_to :site

  def analyse
    puts self.url
  end

end
