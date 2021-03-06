require 'spec_helper'

describe Owner do
  let(:blanks) { [nil, ''] }

  it { should validate_presence_of :first_name }
  it { should have_valid(:first_name).when('Joe', 'John') }
  it { should_not have_valid(:first_name).when(*blanks) }

  it { should validate_presence_of :last_name }
  it { should have_valid(:last_name).when('Joe', 'John') }
  it { should_not have_valid(:last_name).when(*blanks) }

  it { should validate_presence_of :email }
  it { should have_valid(:email).when('user@example.com', 'example@aol.net') }
  it { should_not have_valid(:email).when(*blanks, 'user', 'user@user', 'user.com') }

  it { should have_valid(:company).when(*blanks, 'Motorola', 'Company') }

  it { should have_many(:buildings).dependent(:nullify) }

  it "should remove owner from building if owner is deleted" do
    owner = FactoryGirl.create(:owner)
    building = FactoryGirl.create(:building)
    building.owner_id = owner.id
    building.save
    expect(building.owner_id).to eq(owner.id)
    owner.destroy
    building = Building.find(building)
    expect(building.owner_id).to eql(nil)
  end
end
