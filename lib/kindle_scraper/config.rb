module KindleScraper
  class Config
    attr_accessor :top_level_domain, :base_url, :paths

    def initialize
      self.top_level_domain = 'com'
      self.paths = {
        login: '/login',
        books: '/your_reading'
      }
      self.base_url = 'https://kindle.amazon.%s'
    end

    def url(path, params = [])
      url = File.join(sprintf(base_url, top_level_domain), paths[path])
      sprintf(url, *params)
    end
  end
end
