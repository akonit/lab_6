class SessionsController < ApplicationController
  
    http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

	def new
		@session = Session.new
        @films = Film.all
        @cinemas = Cinema.all
	end

    def create
    	@session = Session.new(session_params)
 
        if @session.save
            redirect_to @session
	    else
	        render 'new'
	    end
    end

	def edit
	    @session = Session.find(params[:id])
        @cinema = Cinema.find(@session.cinema_id)
        @film = Film.find(@session.film_id)
	end

	def update
	    @session = Session.find(params[:id])
	 
	    if @session.update(session_params)
	        redirect_to @session
	    else
	        render 'edit'
	    end
	end

    def show
        @session = Session.find(params[:id])
        @cinema = Cinema.find(@session.cinema_id)
        @film = Film.find(@session.film_id)
    end

	def index
        @sessions = Session.all
    end

	def destroy
	  	@session = Session.find(params[:id])
	  	@session.destroy
	 
	  	redirect_to sessions_path
	end

    private
	    def session_params
	        params.require(:session).permit(:start, :end, :cinema_id, :film_id)
	    end
end
