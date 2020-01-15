RSpec.describe Api::V1::ArticlesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'GET /api/v1/articles/:id' do
    let!(:existing_entries) do
      create(:article,
            title: 'Breaking News',
            body: 'Some breaking content')
    end

    before do
      get '/api/v1/articles/:id', headers: headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns an article' do
      expect(response_json.count).to eq 1
    end

    it 'returns article title' do
      binding.pry
      expect(response_json["entries"][0]["title"]).to eq "Breaking News"
    end

  end
end