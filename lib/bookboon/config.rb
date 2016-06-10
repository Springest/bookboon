module Bookboon
  class Config
    attr_accessor :id, :secret, :branding_id, :rotation_id, :language

    def initialize
      @language = "en"
    end

    def headers
      _headers = {}

      _headers["Accept-Language"] = @language
      _headers["X-Bookboon-Branding"] = branding_id if branding_id
      _headers["X-Bookboon-Rotation"] = rotation_id if rotation_id

      _headers
    end
  end
end
