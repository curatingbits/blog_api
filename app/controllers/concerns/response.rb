# frozen_string_literal: true

# Helper for json calls

module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
