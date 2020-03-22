class CommentsController < ApplicationController

  before_action :require_user


  def create 
    @recipe= Recipe.find(params[:recipe_id])
    @comment= @recipe.comments.build(comment_params)
    @comment.chef = current_chef
    if @comment.save 
      # ActionCable.server.broadcast "comments_channel" , content: @comment.description
      ActionCable.server.broadcast "comments_channel" , render(partial:'comments/comment',object: @comment)
      
      #flash[:success]=" Your comments create successfully #{@comment.chef.chefname}"
      #redirect_to recipe_path(@recipe)
    else
      flash[:danger]=" Your comment NOT create #{@comment.chef.chefname}"
      redirect_back fallback_location: 'recipes/show'
    end
  end

 

  private
 
  def comment_params
    params.require(:comment).permit(:description)
  end


end