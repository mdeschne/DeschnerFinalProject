Rails.application.routes.draw do

  # Routes for the Feed Sorting
  get "/top", :controller => "media", :action => "index"
  get "/newest", :controller => "media", :action => "newest"
  get "/worst", :controller => "media", :action => "worst"

  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  # Routes for the Favorite resource:
  # CREATE
  get "/favorites/new", :controller => "favorites", :action => "new"
  post "/create_favorite", :controller => "favorites", :action => "create"

  # READ
  get "/favorites", :controller => "favorites", :action => "index"
  get "/favorites/:id", :controller => "favorites", :action => "show"

  # UPDATE
  get "/favorites/:id/edit", :controller => "favorites", :action => "edit"
  post "/update_favorite/:id", :controller => "favorites", :action => "update"

  # DELETE
  get "/delete_favorite/:id", :controller => "favorites", :action => "destroy"
  #------------------------------

  # Routes for the Add resource:
  # CREATE
  get "/adds/new", :controller => "adds", :action => "new"
  post "/create_add", :controller => "adds", :action => "create"

  # READ
  get "/adds", :controller => "adds", :action => "index"
  get "/adds/:id", :controller => "adds", :action => "show"

  # UPDATE
  get "/adds/:id/edit", :controller => "adds", :action => "edit"
  post "/update_add/:id", :controller => "adds", :action => "update"

  # DELETE
  get "/delete_add/:id", :controller => "adds", :action => "destroy"
  #------------------------------

  # Routes for the Playlist resource:
  # CREATE
  get "/playlists/new", :controller => "playlists", :action => "new"
  post "/create_playlist", :controller => "playlists", :action => "create"

  # READ
  get "/playlists", :controller => "playlists", :action => "index"
  get "/playlists/:id", :controller => "playlists", :action => "show"

  # UPDATE
  get "/playlists/:id/edit", :controller => "playlists", :action => "edit"
  post "/update_playlist/:id", :controller => "playlists", :action => "update"

  # DELETE
  get "/delete_playlist/:id", :controller => "playlists", :action => "destroy"
  #------------------------------

  # Routes for the Medium resource:
  # CREATE
  get "/media/new", :controller => "media", :action => "new"
  post "/create_medium", :controller => "media", :action => "create"

  # READ
  get "/media", :controller => "media", :action => "index"
  get "/media/:id", :controller => "media", :action => "show"



  get "/upvote/:id", :controller => "media", :action => "up"
  get "/downvote/:id", :controller => "media", :action => "down"

  # UPDATE
  get "/media/:id/edit", :controller => "media", :action => "edit"
  post "/update_medium/:id", :controller => "media", :action => "update"

  # DELETE
  get "/delete_medium/:id", :controller => "media", :action => "destroy"
  #------------------------------

  devise_for :users
   root to: "media#index"

   # READ
get "/users", :controller => "users", :action => "index"
get "/users/:id", :controller => "users", :action => "show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
