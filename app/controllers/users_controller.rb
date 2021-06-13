class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @prototype = Prototype.all
    # @users = @prototype.user
    # @users = @prototype.user.all
    # @users = @user.prototype
    @prototype = Prototype.new
    @protolist = @user.prototypes
    
    # binding.pry
  end

end
