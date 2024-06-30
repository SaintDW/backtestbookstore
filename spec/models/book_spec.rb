# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  release     :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe 'Book', type: :model do
  describe 'validation book' do
    describe ':book' do
      subject(:factory) { create(:book) }

      it { is_expected.to be_valid }
    end
  end

  describe 'callbacks book' do
    it 'get all book' do
      book = create(:book)
      book = create(:book)
      expect(Book.count).to be >= 1
    end

    it 'get by id book' do
      book = create(:book)
      found_book = Book.find_by(id: book.id)
      expect(found_book).to eq(book)
    end

    it 'create book' do
      book = create(:book)
      book.save
      expect(book.name).to eq('name')
      expect(book.description).to eq('description')
      expect(book.release).to eq('2024-06-26 12:34:56.000')
    end

    it 'update book' do
      book = create(:book)
      book.update(name: 'nametest', description: 'descriptiontest')
      expect(book.name).to eq('nametest')
      expect(book.description).to eq('descriptiontest')
    end

    it 'deletes book' do
      book = create(:book)
      book.destroy
      expect(Book.find_by(id: book.id)).to be_nil
    end
  end

  #   describe 'associations book' do
  #   end

  #   describe 'scopes book' do
  #   end

  #   describe 'methods book' do
  #   end
end
