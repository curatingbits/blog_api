# frozen_string_literal: true

# ExceptionHandler allows for custom responses when errors are raised
module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      if Rails.env.production?
        json_response({}, status: :not_found)
      else
        json_response({ message: e.message }, :not_found)
      end
    end
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(err)
    json_response({ message: err.message }, :unprocessable_entity)
  end
end
