class UsersController < ApplicationController
  def profile
    @user = current_user
    @matches = Matches.where(user_id: @user)
  end
end
