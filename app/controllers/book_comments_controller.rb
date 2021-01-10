class BookCommentsController < ApplicationController
  def create
    comment = BookComment.new(comment_params)
    comment.user_id = current_user.id
    @showbook = Book.find(params[:book_id])
    comment.book_id = @showbook.id
    unless comment.save
      # redirect_to request.referer
      @user = @showbook.user
      @book = Book.new
      render "books/show"
    end
  end
  
  def destroy
    comment = BookComment.find(params[:id])
    @showbook = Book.find(comment.book_id)
    if comment.user != current_user
      redirect_to book_path(comment.book)
    end
    comment.destroy
    # redirect_to book_path(comment.book)
  end
  
  private
  
  def comment_params
    params.require(:book_comment).permit(:comment)
    # params.require()
  end
end
