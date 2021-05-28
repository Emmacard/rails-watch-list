class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:movie_id])
  end

  # def method_name

  # end

  # private

  def bookmark
    params.require(:bookmark).permit(:comment)
  end
end
