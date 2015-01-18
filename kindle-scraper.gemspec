$:.push File.expand_path('../lib', __FILE__)

require 'kindle_scraper/version'

Gem::Specification.new do |s|
  s.name        = 'kindle-scraper'
  s.version     = KindleScraper::VERSION
  s.authors     = ['Daniel Perez']
  s.email       = ['tuvistavie@gmail.com']
  s.homepage    = 'https://github.com/tuvistavie/kindle-scraper'
  s.summary     = 'Library to scrape kindle books, notes and highlights.'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_development_dependency 'rspec', '~> 3.0'

  s.add_dependency 'watir-webdriver', '~> 0.6.11'
  s.add_dependency 'headless', '~> 1.0.2'
end
