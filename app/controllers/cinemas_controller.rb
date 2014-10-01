class CinemasController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

	def new
		@cinema = Cinema.new
	end

    def create
    	@cinema = Cinema.new(cinema_params)
 
        if @cinema.save
            redirect_to @cinema
	    else
	        render 'new'
	    end
    end

	def edit
	    @cinema = Cinema.find(params[:id])
	end

	def update
	    @cinema = Cinema.find(params[:id])
	 
	    if @cinema.update(cinema_params)
	        redirect_to @cinema
	    else
	        render 'edit'
	    end
	end

    def show
        @cinema = Cinema.find(params[:id])
    end

    def index
        @cinemas = Cinema.all
    end

	def destroy
	  	@cinema = Cinema.find(params[:id])
	  	@cinema.destroy
	 
	  	redirect_to cinemas_path
	end

    private
	    def cinema_params
	        params.require(:cinema).permit(:name, :description, :address)
	    end
end
