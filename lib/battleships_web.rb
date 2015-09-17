require 'sinatra/base'
require_relative '../game_setup.rb'

class BattleshipsWeb < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = session[:name]
    erb :new_game
  end

  post '/new_game' do
    session[:name]= params[:name]
    redirect ('/new_game')
  end

  get '/start_game' do
    board = Board.new(Cell)
    @board = board.print_board
    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  set :views, proc { File.join(root, '..', 'views') }
end
