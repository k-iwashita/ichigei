class Public::BookMarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = current_user.posts.new
    @works = []
    current_user.book_marks.each { |book_mark| @works << book_mark.work }
  end
  
  def create
    @user = current_user
    @works = Work.find(params[:work_id])
    @fav = @user.book_marks.create(work_id: @works.id)
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @works = Work.find(params[:work_id])
    @fav = current_user.book_marks.find_by(work_id: @works.id)
    @fav.destroy
    # redirect_back(fallback_location: root_path)
  end
end
