class BookService
  def self.get_all_book
    cached_book = Rails.cache.read(Book.first.cache_key_with_version)
    if cached_book
      puts 'cached_book from cached'
      return cached_book
    end

    puts 'cached_book from DB'
    Rails.cache.write(Book.first.cache_key_with_version, Book.all)
    Rails.cache.read(Book.first.cache_key_with_version)
  end

  def self.get_book_by_id(book_id)
    cached_book = Rails.cache.read(Book.first.cache_key_with_version)
    if cached_book
      puts 'cached_bookid from cached'
      cached_book_id = cached_book.find { book_id }
      return cached_book_id
    end

    puts 'cached_book_id from DB'
    Rails.cache.write(Book.first.cache_key_with_version, Book.all)
    cached_book_id = Rails.cache.read(Book.first.cache_key_with_version)
    cached_book.find { cached_book_id }
  end

  def self.create_book(name, description, release)
    # Rails.cache.write(Book.first.cache_key_with_version, Book.create({ name:, description:, release: }))
    Book.create({ name:, description:, release: })
  end

  def self.update_book(book_id, name, description, release)
    Book.find(book_id).update({ name:, description:, release: })
  end

  def self.delete_book(book_id)
    Book.find(book_id).destroy
  end
end
