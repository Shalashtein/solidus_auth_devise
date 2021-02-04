# frozen_string_literal: true

class Spree::UserConfirmationsController < Devise::ConfirmationsController
  helper 'spree/base', 'spree/store'

  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Common
  include Spree::Core::ControllerHelpers::Order
  include Spree::Core::ControllerHelpers::Store

  protected

  def after_confirmation_path_for(resource_name, resource)
    signed_in?(resource_name) ? main_app.root_path : spree.login_path
  end
end
