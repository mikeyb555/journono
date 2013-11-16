namespace :journono do

  desc "Scan the index of sites to look for new articles"
  task :scan => [:environment] do
    Site.all(batch_size: 100).each { |site| site.scan_new_articles; sleep(0.01) }
  end

  desc "Analyse article queue"
  task :analyse => [:environment] do
    sqs = AWS::SQS.new
    queue = sqs.queues.create(ARTICLE_QUEUE)
    queue.poll do |msg|
      article = Article.find(msg.body)
      article.analyse
    end
  end

end