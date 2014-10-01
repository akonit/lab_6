class SearchController < ApplicationController
  def by_film
  end

  def by_film_result
	  if params[:search] && params[:search] != nil && params[:search] != ""
          @films = Film.search(params[:search])
          if @films != nil && @films.size > 0
      	      @film = @films.first
	          @sessions = Session.where(film_id: @film.id)
	      else
	      	  redirect_to search_by_film_path
	      end
	  else
	      redirect_to search_by_film_path
	  end
  end

  def by_session
  end

  def by_session_result
	  if params[:from] && params[:from] != nil && params[:from] != "" && params[:to] && params[:to] != nil && params[:to] != ""
	  	  @from = DateTime.strptime(params[:from], "%Y-%m-%d %H:%M:%S").to_i
          @to = DateTime.strptime(params[:to], "%Y-%m-%d %H:%M:%S").to_i
  	      @sessions = Session.search(params[:from].gsub(/[-: ]/, ''), params[:to].gsub(/[-: ]/, ''))
	  else
	      redirect_to search_by_session_path
	  end
  end

  def by_cinema
  end

  def by_cinema_result
	  if params[:search] && params[:search] != nil && params[:search] != ""
          @cinemas = Cinema.search(params[:search])
          if @cinemas != nil && @cinemas.size > 0
      	      @cinema = @cinemas.first
	          @sessions = Session.where(cinema_id: @cinema.id)
	      else
	      	  redirect_to search_by_cinema_path
	      end
	  else
	      redirect_to search_by_cinema_path
	  end
  end
end
