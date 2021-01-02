class BookCommentsController < ApplicationController
  def create
    comment = BookComment.new(comment_params)
    comment.user_id = current_user.id
    book = Book.find(params[:book_id])
    comment.book_id = book.id
    if comment.save
      redirect_to request.referer
    else
    end
  end
  
  def destroy
    
  end
  
  private
  
  def comment_params
    params.require(:book_comment).permit(:comment)
    # params.require()
  end
end
