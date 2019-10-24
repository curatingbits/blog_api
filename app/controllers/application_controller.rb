# frozen_string_literal: true

# Application Controller class defined below
class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
end
