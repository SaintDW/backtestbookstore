# require 'rails_helper'

# RSpec.describe V1::Api, type: :request do
#   describe 'GET /v1/books' do
#     let(:book) { create(:book) }

#     it 'returns the book' do
#       get '/v1/books'
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe 'GET /v1/books/:id' do
#     let(:book) { create(:book) }

#     it 'returns the book' do
#       get '/v1/books/#{book.id}'
#       expect(response).to have_http_status(:success)
#       expect(JSON.parse(response.body)['id']).to eq(book.id)
#     end
#   end
# end
