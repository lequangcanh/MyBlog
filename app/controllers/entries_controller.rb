class EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
    @comments = @entry.comments.paginate(page: params[:page], per_page: 10)
  end
end
