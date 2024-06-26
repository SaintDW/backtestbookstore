module V1
  class BookAPI < Grape::API
    namespace 'book' do
      desc 'GET /api/v1/book'
      get do
        books = Book.all
        render_json(:ok, books)
      end
    end
  end
end
