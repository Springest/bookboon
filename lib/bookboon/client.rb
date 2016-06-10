module Bookboon
  class Client
    attr_accessor :last_request

    def initialize
      if block_given?
        yield(config)
      end
    end

    def categories
      get("categories")
    end

    def category(id)
      get("categories/#{id}")
    end

    def search(term)
      get("search", query: { q: term })
    end

    def book(id)
      get("books/#{id}")
    end

    def download_book(id, handle)
      request = post("books/#{id}/download", body: { handle: handle })

      request.headers['location']
    end

    # TODO: Implement /questions
    # TODO: Implement /recommendations

    protected

    def config
      @config ||= Bookboon::Config.new
    end

    def request(method, path, options)
      uri = URI("https://bookboon.com/api/#{path}")

      options = {
        basic_auth: {
          username: config.id,
          password: config.secret,
        },
        headers: config.headers,
        follow_redirects: false,
      }.merge(options)

      HTTParty.send(method, uri, options)
    end

    def get(path, options = {})
      request(:get, path, options)
    end

    def post(path, options = {})
      request(:post, path, options)
    end
  end
end
