require 'ims/lti'
require 'oauth/request_proxy/action_controller_request'
# require something that has key and secret
class LaunchController < ApplicationController
  def index
    provider = IMS::LTI::ToolProvider.new(
        Rails.application.config.lti_settings['consumer_key'], 
        Rails.application.config.lti_settings['consumer_secret'], 
        request.query_parameters
    )

    if provider.valid_request?(request)
        # The provider worked!
        session[:user_id] = params[:custom_canvas_user_id]
        @user_id = session[:user_id]
        render
    else
        render :error, status: 401
    end
  end

end
