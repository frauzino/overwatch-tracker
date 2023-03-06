class UsersController < ApplicationController
  def profile
    @user = current_user
    @matches = Match.where(user_id: @user)
  end
end
