class WelcomeController < ApplicationController
  def index
    @sites = Site.limit(5)
  end
end
