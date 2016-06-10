require "test_helper"

class Bookboon::ConfigTest < Minitest::Test
  def setup
    @config = Bookboon::Config.new
  end

  def test_default_language
    assert_equal "en", @config.language
  end

  def test_headers_without_branding_rotation
    assert_equal @config.headers, { "Accept-Language" => "en" }
  end

  def test_headers_with_different_language
    @config.language = "nl"

    assert_equal @config.headers, { "Accept-Language" => "nl" }
  end

  def test_headers_with_branding
    @config.branding_id = "abc"

    assert_equal @config.headers, { "Accept-Language" => "en", "X-Bookboon-Branding" => "abc" }
  end

  def test_headers_with_rotation
    @config.rotation_id = "abc"

    assert_equal @config.headers, { "Accept-Language" => "en", "X-Bookboon-Rotation" => "abc" }
  end
end
