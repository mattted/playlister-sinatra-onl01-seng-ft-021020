require 'sinatra/flash'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    @songs = Song.all.count
    @artists = Artist.all.count
    @genres = Genre.all.count
    @song_genres = SongGenre.all.count
    erb :index
  end
end
