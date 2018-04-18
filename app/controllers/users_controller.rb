class UsersController < ApplicationController
  def index

  	users = User.all

  	render json: users, each_serializer: UserSerializer 

  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  private 

  def user_params
  	params.require(:user).permit(:id, :zen_id, :name, :email, :created_at, :updated_at, :time_zone, :phone, :shared_phone_number, :photo, :locale_id, 
  :locale, :organization_id, :role, :verified, :external_id, :tags, :alias, :active, :shared, :shared_agent, :last_login_at, 
  :two_factor_auth_enabled, :signature, :details, :notes, :role_type, :custom_role_id, :moderator, :ticket_restriction, :only_private_comments, 
  :restricted_agent, :suspended, :chat_only, :default_group_id, :user_fields)
  end

end
