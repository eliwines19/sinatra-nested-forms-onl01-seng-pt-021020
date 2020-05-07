require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :roots
    end

    get '/new' do
      erb :"pirates/new"
    end

    get 'pirates' do
      @pirates = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end

      @ships = Ship.all

      erb :"pirates/show"
    end

  end
end
