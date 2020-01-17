RSpec.describe 'POST /api/admin/articles', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'Successfully' do
    before do
      post "/api/admin/articles",
      params: {
        article: {
          title: "Article 1",
          body: "Some content"
        }
      },
      headers: headers
    end

    it 'can create an article' do 
      binding.pry
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

  end

end