class BookCommentsController < ApplicationController
  def create
    @comment = BookComment.new(comment_params)
    @comment.user_id = current_user.id
    @showbook = Book.find(params[:book_id])
    @comment.book_id = @showbook.id
    if @comment.save
      redirect_to request.referer
    else
      @user = @showbook.user
      @book = Book.new
      render "books/show"
    end
  end
  
  def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
    redirect_to book_path(@comment.book)
  end
  
  private
  
  def comment_params
    params.require(:book_comment).permit(:comment)
    # params.require()
  end
end
