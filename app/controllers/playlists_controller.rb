class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all

    render("playlists/index.html.erb")
  end

  def show
    @playlist = Playlist.find(params[:id])

    render("playlists/show.html.erb")
  end

  def new
    @playlist = Playlist.new

    render("playlists/new.html.erb")
  end

  def create
    @playlist = Playlist.new

    @playlist.title = params[:title]
    @playlist.user_id = params[:user_id]

    save_status = @playlist.save

    if save_status == true
      redirect_to("/playlists/#{@playlist.id}", :notice => "Playlist created successfully.")
    else
      render("playlists/new.html.erb")
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])

    render("playlists/edit.html.erb")
  end

  def update
    @playlist = Playlist.find(params[:id])

    @playlist.title = params[:title]
    @playlist.user_id = params[:user_id]

    save_status = @playlist.save

    if save_status == true
      redirect_to("/playlists/#{@playlist.id}", :notice => "Playlist updated successfully.")
    else
      render("playlists/edit.html.erb")
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])

    @playlist.destroy

    if URI(request.referer).path == "/playlists/#{@playlist.id}"
      redirect_to("/", :notice => "Playlist deleted.")
    else
      redirect_to(:back, :notice => "Playlist deleted.")
    end
  end
end
