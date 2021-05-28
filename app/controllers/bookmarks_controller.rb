class BookmarksController < ApplicationController
  before_action :find_list, only: [:new, :create]
  def new
    @bookmark = Bookmark.new
  end

  def create
      # list_id = params[:list_id]
      @bookmark = Bookmark.new(bookmark_params)
      # @bookmark.list_id = list_id
      @bookmark.list = @list
      if @bookmark.save
        redirect_to list_path(@list)
      else
        render :new
      end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    list = bookmark.list
    bookmark.destroy
    redirect_to list_path(list)
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
