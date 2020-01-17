require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
    expect(create(:user)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
  end
end
