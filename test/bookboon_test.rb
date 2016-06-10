require 'test_helper'

class BookboonTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Bookboon::VERSION
  end
end
