module Journono
  class PageFetcher

    def initialize(page)
      @agent = Mechanize.new { |agent|
        agent.user_agent_alias = 'Windows IE 9'
      }
      @page = @agent.get page
    end

    def get_content_body(body_class)
      text = ''
      @page.search('.story-body p').each do |para|
        text = text + para.inner_text
      end

      rank = Highscore::Content.new text
      rank.configure do
        set :multiplier, 2
        set :upper_case, 3
        set :long_words, 2
        set :long_words_threshold, 15
        set :vowels, 1 # => default: 0 = not considered
        set :consonants, 5 # => default: 0 = not considered
        set :ignore_case, true # => default: false
        set :word_pattern, /[\w]+[^\s0-9]/ # => default: /\w+/
      end

      rank.keywords.top(10).each do |keyword|
        puts keyword.text + ' : ' + keyword.weight.to_s
      end

    end

  end
end