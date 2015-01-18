require 'watir-webdriver'
require 'headless'

Dir[File.expand_path('kindle_scraper/**/*.rb', File.dirname(__FILE__))].each do |m|
  require m
end

module KindleScraper
  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end
end
