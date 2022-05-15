RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.parent_controller = '::RailsAdminController'

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # config.model Product do
  #   edit do
  #     field :brand do
  #       eager_load true
  #     end
  #   end
  # end

  # config.model Brand do
  #   edit do
  #     field :products do
  #       eager_load true
  #     end
  #   end
  # end

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

# RailsAdmin.config "Product" do
#   field :brand do
#     eager_load true
#   end
# end
