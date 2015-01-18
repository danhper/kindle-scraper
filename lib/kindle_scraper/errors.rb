module KindleScraper
  class Error < ::StandardError
  end

  class NeedSigninError < KindleScraper::Error
  end
end
