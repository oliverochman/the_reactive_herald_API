RSpec.describe Article, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :body }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :journalist }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryBot.create(:article)).to be_valid
    end
  end
end
