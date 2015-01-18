module KindleScraper
  class Model
    def initialize(attrs = {})
      attrs.each { |k, v| send("#{k}=", v) }
    end
  end

  class Book < KindleScraper::Model
    attr_accessor :image_url, :title, :reference, :author
  end
end
