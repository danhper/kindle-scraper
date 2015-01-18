module KindleScraper
  class Client
    attr_accessor :logged_in

    def initialize
      self.logged_in = false
    end

    def login(email, password)
      browser.goto config.url(:login)
      browser.text_field(name: 'email').set(email)
      browser.text_field(name: 'password').set(password)
      browser.button(id: 'signInSubmit').click
      self.logged_in = !browser.text_field(name: 'email').exists?
    end

    def parse_books
      fail NeedSigninError, 'need to be signed in to parse_books' unless self.logged_in
      browser.goto config.url(:books)
      books = parse_current_page_books
      while !book_next_link.class_name.include?('disabled')
        book_next_link.click
        books += parse_current_page_books
      end
      books
    end

    private

    def parse_current_page_books
      readings = browser.table(id: "yourReadingList").tbody
      readings.trs.map { |row| parse_book(row) }
    end

    def book_next_link
      browser.div(class: 'paginationLinks').elements.last
    end

    def parse_book(row)
      book = KindleScraper::Book.new
      book.image_url = row.td(class: 'coverImage').img.src
      info = row.td(class: 'titleAndAuthor')
      book.title = info.a.text
      book.author = info.span(class: 'author').text
      book.reference = File.basename(info.a.href)
      book
    end

    def config
      KindleScraper.config
    end

    def browser
      return @browser unless @browser.nil?
      @headless = Headless.new
      @headless.start
      @browser ||= Watir::Browser.new
    end
  end
end
