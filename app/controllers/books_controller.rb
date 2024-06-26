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

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])

    if @books.update(book_params)
      redirect_to @books
    else
      render :edit
    end
  end

  def destroy
    @books = Book.find(params[:id])
    @book.destroy

    redirect_to root_path
  end

  private

  def book_params
    params.require(:books).permit(:name, :description, :release)
  end
end
