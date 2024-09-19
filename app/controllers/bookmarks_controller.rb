class BookmarksController < ApplicationController
before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @bookmark
    @bookmark.save

    redirect_to list_path(@list)
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end
  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
