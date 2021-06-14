class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @prototype = Prototype.new
    @protolist = @user.prototypes
  end

end
