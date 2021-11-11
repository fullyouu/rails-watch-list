class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    id = params[:id]
    @list = List.find(id)
    @bookmark = Bookmark.new
  end

  def new
    @lists = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:list).permit(:name)
  end
end
