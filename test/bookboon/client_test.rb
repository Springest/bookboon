require "test_helper"

class Bookboon::ClientTest < Minitest::Test
  def setup
    @client = Bookboon::Client.new
  end

  def test_categories
    url = "https://bookboon.com/api/categories"
    stub_request(:any, url)

    @client.categories

    assert_requested(:get, url)
  end

  def test_category
    url = "https://bookboon.com/api/categories/123"
    stub_request(:any, url)

    @client.category(123)

    assert_requested(:get, url)
  end

  def test_search
    url = "https://bookboon.com/api/search?q=abc"
    stub_request(:any, url)

    @client.search("abc")

    assert_requested(:get, url)
  end

  def test_book
    url = "https://bookboon.com/api/books/123"
    stub_request(:any, url)

    @client.book("123")

    assert_requested(:get, url)
  end

  def test_download_book
    url = "https://bookboon.com/api/books/123/download"
    fake_download_url = "https://bookboon.com/some_kind_of_download_url"
    stub_request(:any, url).with(body: { handle: "dennis@springest.com" }).to_return(headers: { location: fake_download_url })

    request = @client.download_book("123", "dennis@springest.com")

    assert_requested(:post, url, body: { handle: "dennis@springest.com" })

    assert fake_download_url, request
  end

  def test_configured_headers
    @client = Bookboon::Client.new do |config|
      config.id = "123"
      config.secret = "secret"
      config.language = "nl"
      config.branding_id = "branding456"
      config.rotation_id = "rotation789"
    end

    url = "https://bookbook.com/api/categories"
    expected_headers = {
      "Accept-Language" => "nl",
      "Authorization" => "Basic MTIzOnNlY3JldA==",
      "X-Bookboon-Branding" => "branding456",
      "X-Bookboon-Rotation" => "rotation789",
    }

    url = "https://bookboon.com/api/categories"
    stub_request(:any, url).with(headers: expected_headers)

    @client.categories

    assert_requested(:get, url, headers: expected_headers)
  end
end
