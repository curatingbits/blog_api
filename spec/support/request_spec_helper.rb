# frozen_string_literal: true

# RequestSpecHelper shortcut to parse json response

module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end
end
