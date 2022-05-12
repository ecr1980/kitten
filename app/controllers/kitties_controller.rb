class KittiesController < ApplicationController
  
  def index
    @kitties = Kitty.all
  end

  def show
    @kitty = Kitty.find(params[:id])
  end

  def new
    @kitty = Kitty.new
  end

  def create
    @kitty = Kitty.new(kitty_params)

    if @kitty.save
      redirect_to kitty_path(@kitty)
    end
  end

  def edit
  end

  def update
    @kitty = Kitty.find(params[:id])
    if @kitty.update(kitty_params)
      redirect_to kitty_path
    end
  end

  private

  def kitty_params
    params.require(:kitty).permit(:name, :age, :cuteness, :softness)
  end

end
