class AddsController < ApplicationController
  def index
    @adds = Add.all

    render("adds/index.html.erb")
  end

  def show
    @add = Add.find(params[:id])

    render("adds/show.html.erb")
  end

  def new
    @add = Add.new

    render("adds/new.html.erb")
  end

  def create
    @add = Add.new

    @add.media_id = params[:media_id]
    @add.playlist_id = params[:playlist_id]

    save_status = @add.save

    if save_status == true
      redirect_to("/adds/#{@add.id}", :notice => "Add created successfully.")
    else
      render("adds/new.html.erb")
    end
  end

  def edit
    @add = Add.find(params[:id])

    render("adds/edit.html.erb")
  end

  def update
    @add = Add.find(params[:id])

    @add.media_id = params[:media_id]
    @add.playlist_id = params[:playlist_id]

    save_status = @add.save

    if save_status == true
      redirect_to("/adds/#{@add.id}", :notice => "Add updated successfully.")
    else
      render("adds/edit.html.erb")
    end
  end

  def destroy
    @add = Add.find(params[:id])

    @add.destroy

    if URI(request.referer).path == "/adds/#{@add.id}"
      redirect_to("/", :notice => "Add deleted.")
    else
      redirect_to(:back, :notice => "Add deleted.")
    end
  end
end
