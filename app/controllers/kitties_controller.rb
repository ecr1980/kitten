class KittiesController < ApplicationController
  
  def index
    @kitties = Kitty.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @kitties }
      format.json { render :json => @kitties }
    end
  end

  def show
    @kitty = Kitty.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @kitty }
      format.json { render :json => @kitty }
    end
  end

  def new
    @kitty = Kitty.new
  end

  def create
    @kitty = Kitty.new(kitty_params)

    if @kitty.save
      redirect_to kitty_path(@kitty), notice: "Happy day, your kitten has been added!"
    else
      redirect_to new_kity_path, notice: "How did you mess this form up? Try again."
    end
  end

  def edit
  end

  def update
    @kitty = Kitty.find(params[:id])
    if @kitty.update(kitty_params)
      redirect_to kitty_path, notice: "Your kitty cat has been updated."
    else
      redirect_to kity_path, notice: "How did you mess this form up? Try again"
    end
  end

  def destroy
    @kitty = Kitty.find(params[:id])
    @kitty.destroy
    redirect_to root_path, notice: "Aw, you killed the cat. :("
  end

  private

  def kitty_params
    params.require(:kitty).permit(:name, :age, :cuteness, :softness)
  end

end
