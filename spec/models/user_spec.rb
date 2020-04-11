require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:street_address)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:zip)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
  end

  describe "relationships" do
    it {should have_many :orders}
  end
end
