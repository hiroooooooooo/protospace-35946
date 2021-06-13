class PrototypesController < ApplicationController
  

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(strong_params)
    if @prototype.valid?
      @prototype.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def index
    @prototype = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
    
    @comment_list = @prototype.comments
    # binding.pry
  end

  def edit
    unless user_signed_in?
      redirect_to action: :index
    end

    # http://localhost:3000/prototypes/5/edit
    # @prototype = Prototype.new
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(strong_params)
      redirect_to prototype_path(@prototype.id)
    else
      render "edit"
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    # binding.pry
    @prototype.destroy
    redirect_to root_path
  end

  private

  def strong_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  
end
