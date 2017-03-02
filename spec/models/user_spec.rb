require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should has_many(:favorite_gifs) }
  it { should has_many(:gifs) }
end


# RSpec.describe Donation, type: :model do
#   it { should validate_presence_of(:title) }
#   it { should validate_presence_of(:description) }
#   it { should validate_presence_of(:price) }
#   it { should validate_presence_of(:image_path) }
#   it { should belong_to(:category) }
#
# it { should validate_uniqueness_of(:name) }
#   it { should have_many(:donations) }
