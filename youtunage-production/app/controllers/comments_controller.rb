class CommentsController < ApplicationController
  def index
    @comments = Comment.all

    redirect_to(request.referrer)
  end

  def show
    @comment = Comment.find(params[:id])

    redirect_to(request.referrer)
  end

  def new
    @comment = Comment.new

    redirect_to(request.referrer)
  end

  def create
    @media = Medium.all
    @comment = Comment.new

    @comment.medium_id = params[:medium_id]
    @comment.body = params[:body]
    @comment.user_id = params[:user_id]

    save_status = @comment.save



    if save_status == true
    redirect_to(request.referrer, :notice => "Comment created successfully.")
    else
    redirect_to(request.referrer)
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    render("comments/edit.html.erb")
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.medium_id = params[:medium_id]
    @comment.body = params[:body]
    @comment.user_id = params[:user_id]

    save_status = @comment.save

    if save_status == true
      redirect_to("/media/#{@comment.medium_id}", :notice => "Comment updated successfully.")
    else
      redirect_to("/media/#{@comment.medium_id}")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

      redirect_to(request.referrer, :notice => "Comment deleted.")

  end
end
