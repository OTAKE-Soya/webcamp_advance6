class SearchController < ApplicationController
  
  def search
    target = params[:target]
    search_word = params[:body]
    pattern = params[:pattern]
    
    if target == "user"
      @users = User.search(pattern, search_word)
      p @users
    else
      @books = Book.search(pattern, search_word)
    end
  end
end
