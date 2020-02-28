class RelationshipsController < ApplicationController
    def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)

        relationship = current_user.active_relationships.find_by(followed: @user)
        relationship.create_activity(user: current_user)

        redirect_to users_url
    end

    def destroy
        @user = Relationship.find(params[:id]).followed #idは、activerelationshipのどのrelationshipかを示している
        current_user.unfollow(@user)

        redirect_to users_url
    end
end
