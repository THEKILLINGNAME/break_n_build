class ApplicationController < ActionController::Base
  before_action :actions_with_current_user
  add_flash_types :error

  def actions_with_current_user
    if current_user
      @email = current_user.email
    end
  end
end
