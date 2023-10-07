class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticy_token
end
