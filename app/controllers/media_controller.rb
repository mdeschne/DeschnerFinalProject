class MediaController < ApplicationController

  def index
    @media = Medium.all
    @users = User.all
    @comments = Comment.all
    @media = @media.sort {|a,b| (b.ups - b.downs) <=> (a.ups - a.downs)}
    @order = "Top"
    render("media/index.html.erb")
  end

  def newest
     @media = Medium.all
     @users = User.all
     @comments = Comment.all
     @media = @media.sort {|a,b| (b.created_at) <=> (a.created_at)}
    @order = "Newest"
     render("media/index.html.erb")
   end

   def worst
     @media = Medium.all
     @users = User.all
     @comments = Comment.all
     @media = @media.sort {|a,b| (a.ups - a.downs) <=> (b.ups - b.downs)}
    @order = "Worst"
     render("media/index.html.erb")
   end


  def show
    @medium = Medium.find(params[:id])
    @comments = Comment.all
    render("media/show.html.erb")
  end

  def new
    @medium = Medium.new

    render("media/new.html.erb")
  end

  def create
    @medium = Medium.new

    @medium.media_url = params[:media_url]
    @medium.ups = params[:ups]
    @medium.downs = params[:downs]
    @medium.user_id = params[:user_id]
    @medium.title = params[:title]

    @medium.media_url = @medium.media_url.gsub("m.youtube", "www.youtube")
    save_status = @medium.save

    if save_status == true
      redirect_to("/media/#{@medium.id}", :notice => "Video added successfully.")
    else
      render("media/new.html.erb")
    end
  end

  def up
    @medium = Medium.find(params[:id])

    ups = @medium.ups
    ups = ups+1
    @medium.ups = ups

    save_status = @medium.save

    if save_status == true
      redirect_to(request.referrer, :notice => "Upvoted successfully.")
    else
      redirect_to(request.referrer)
    end
  end

  def down
    @medium = Medium.find(params[:id])

    downs = @medium.downs
    downs = downs+1
    @medium.downs = downs

    save_status = @medium.save

    if save_status == true
      redirect_to(request.referrer, :notice => "Downvoted successfully.")
    else
      redirect_to(request.referrer)
    end
  end

  def edit
    @medium = Medium.find(params[:id])

    render("media/edit.html.erb")
  end

  def update
    @medium = Medium.find(params[:id])

    @medium.media_url = params[:media_url]
    @medium.ups = params[:ups]
    @medium.downs = params[:downs]
    @medium.user_id = params[:user_id]
    @medium.title = params[:title]

    save_status = @medium.save

    if save_status == true
      redirect_to("/media/#{@medium.id}", :notice => "Video updated successfully.")
    else
      render("media/edit.html.erb")
    end
  end

  def destroy
    @medium = Medium.find(params[:id])

    @medium.destroy

    if URI(request.referer).path == "/media/#{@medium.id}"
      redirect_to("/", :notice => "Video deleted.")
    else
      redirect_to(:back, :notice => "Video deleted.")
    end
  end
end
