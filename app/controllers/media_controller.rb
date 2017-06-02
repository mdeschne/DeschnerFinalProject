class MediaController < ApplicationController

  def index
    @media = Medium.all
    @users = User.all
    @comments = Comment.all
    # Medium.all.order(:ups => :desc)
    @media = @media.sort {|a,b| (b.ups - b.downs) <=> (a.ups - a.downs)}
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
      redirect_to("/media/", :notice => "Upvoted successfully.")
    else
      render("media.html.erb")
    end
  end

  def down
    @medium = Medium.find(params[:id])

    downs = @medium.downs
    downs = downs+1
    @medium.downs = downs

    save_status = @medium.save

    if save_status == true
      redirect_to("/media", :notice => "Downvoted successfully.")
    else
      render("media.html.erb")
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
