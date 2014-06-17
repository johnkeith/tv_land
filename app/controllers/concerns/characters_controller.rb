class CharactersController < ApplicationController

  def create
    @television_show = TelevisionShow.find(params[:television_show_id])
    @character = Character.new(character_params)
    @character.television_show_id = @television_show.id

    if @character.save
      flash[:notice] = "Character successfully added"
      redirect_to "/television_shows/#{@television_show.id}"
    else
      flash[:notice] = "There was an error!"
      render :'television_shows/show'
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :actor, :description)
  end
end
