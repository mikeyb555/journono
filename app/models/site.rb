require 'journono/target_module'

class Site
  include Dynamoid::Document

  class_attribute :module

  field :name
  field :url
  field :last_scan, :datetime
  field :module_class, :integer

  def get_module
    if self.module.nil?
       self.module = Journono::TargetModule::get_module(self)
    end
    return self.module
  end

  def scan_new_articles
    target_module = get_module
    articles = target_module.get_new_articles(self.url, self.last_scan)

    sqs = AWS::SQS.new
    queue = sqs.queues.create(ARTICLE_QUEUE)

    articles.each do |article|
      article.site = self
      article.save
      queue.send_message(article.id)
    end
    self.last_scan = Time.new
    self.save
  end

end
