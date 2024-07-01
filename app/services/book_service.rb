class BookService
  def self.get_all_book
    Book.all
  end

  def self.get_book_by_id(book_id)
    Book.find(book_id)
  end

  def self.create_book(name, description, release)
    Rails.cache.write(Book.first.cache_key_with_version, Book.create({ name:, description:, release: }))
  end

  def self.update_book(book_id, name, description, release)
    Book.find(book_id).update({ name:, description:, release: })
  end

  def self.delete_book(book_id)
    Book.find(book_id).destroy
  end
end
