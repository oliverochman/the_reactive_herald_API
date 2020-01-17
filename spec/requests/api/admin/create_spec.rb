RSpec.describe 'POST /api/admin/articles', type: :request do
  let(:journalist) { create(:user, role: 'journalist')}
  let(:journalist_credentials) { journalist.create_new_auth_token }
  let!(:journalist_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(journalist_credentials) }

  let!(:non_authorized_headers) { { HTTP_ACCEPT: 'application/json' } }

  let(:regular_user) { create(:user, role: 'user')}
  let(:regular_user_credentials) { regular_user.create_new_auth_token }
  let!(:regular_user_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(regular_user_credentials) }



  describe 'Successfully with valid params and user' do
    before do
      post "/api/admin/articles",
      params: {
        article: {
          title: "Article 1",
          body: "Some content"
        }
      },
      headers: journalist_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end
  end

  describe 'unsuccessfully with' do
    describe 'no title and content' do
      before do
        post "/api/admin/articles",
        params: {
          article: {
            title: nil,
            body: ""
          }
        },
        headers: journalist_headers
      end
  
      it 'returns a 422 response status' do
        expect(response).to have_http_status 422
      end

      it 'returns error message' do

      end
    end

    describe 'non logged in user' do
      before do
        post "/api/admin/articles",
        params: {
          article: {
            title: 'Title',
            body: "Some content"
          }
        },
        headers: non_authorized_headers
      end
  
      it 'returns a 422 response status' do
        expect(response).to have_http_status 422
      end

      it 'returns error message' do
        
      end
    end

    describe 'user that is not a journalist' do
      before do
        post "/api/admin/articles",
        params: {
          article: {
            title: "Title",
            body: "Some content"
          }
        },
        headers: regular_user_headers
      end
  
      it 'returns a 422 response status' do
        expect(response).to have_http_status 422
      end

      it 'returns error message' do
        
      end
    end
  end
end