class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def new
    @books = Book.new
  end

  def create
    @books = Book.new(book_params)

    if @books.save
      redirect_to @books
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:books).permit(:name, :description)
  end
end
