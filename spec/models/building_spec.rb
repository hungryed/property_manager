require 'spec_helper'

describe Building do
  let(:blanks) { [nil, ''] }

  it { should validate_presence_of :city }
  it { should have_valid(:city).when('Boston', 'Winston-Salem') }
  it { should_not have_valid(:city).when(*blanks) }

  it { should validate_presence_of :state }
  it { should have_valid(:state).when('MA', 'NC', 'CA') }
  it { should_not have_valid(:state).when(*blanks, 'ZZ', 'JIM', 'T', 'Tennessee')}

  it { should validate_presence_of :address }
  it { should have_valid(:address).when('The Moon', 'Towel St.') }
  it { should_not have_valid(:address).when(*blanks) }

  it { should validate_presence_of :postal_code }
  it { should have_valid(:postal_code).when('27106', '02111', '02127') }
  it { should_not have_valid(:postal_code).when('jim', 'seven', '8help') }

  it { should have_valid(:description).when(*blanks, 'hammer',
    'This is a string that is longer than 255 characters cause we are going
    to test the length limit of the universe. Bears are awesome. The police should
    not be around according to a popular song by NWA.') }

end
