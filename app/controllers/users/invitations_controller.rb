class Users::InvitationsController < Devise::InvitationsController
    include Pundit::Authorization
    before_action :configure_permitted_parameters, only: [:create]

    def new
        super
    end

    def create
        @invited_user = User.invite!(user_params.merge(invited_by_id: current_user.id, role: User.roles['member']))
        if @invited_user
            redirect_to root_path
            flash.notice = 'User invited successfully'
        end
        authorize @invited_user
    end

    protected

    def user_params
        params.require(:user).permit(:email, :name, :designation, :address, :gender, :company)
    end
end