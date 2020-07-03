# required for LTI
require 'ims/lti'
# Used to validate oauth signatures
require 'oauth/request_proxy/action_controller_request'


class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # CSRF stuff ^

  # LTI Launch endpoint (responds to POST and GET - see routes.rb)
  # checks for required query params
  # checks that the oauth signature checks out
  # read more about IMS::LTI in ims-lti gem https://github.com/instructure/ims-lti
  # note the oauth nonce is not handled within ims-lti gem, it's up to you
  def launch
    authenticator = IMS::LTI::Services::MessageAuthenticator.new(
      request.url,
      request.request_parameters,
      Rails.application.config.lti_settings['consumer_secret']
    )

    if not authenticator.valid_signature?
      # the request wasnt validated :(
      render :launch_error, status: 401
      return
    end

    # The providre request is valid
    # store the values you need from the LTI
    # here we're just tossing them into the session
    session[:user_id] = params.require :user_id
    session[:lis_person_name_full] = params.require :lis_person_name_full

    # set variables for use by the template
    @lis_person_name_full = session[:lis_person_name_full]
  end

  # lTI XML Configuration
  # Used for easily installing your LTI into an LMS
  def lti_config
    render template: "application/lti_config.xml"
  end

end
