class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
	include ActionController::Helpers
	include ActionController::HttpAuthentication::Token::ControllerMethods

  include ExceptionRescuable
  include BasicAuthenticable
end
