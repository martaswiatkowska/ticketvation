require 'rails_helper'

RSpec.describe Place, type: :model do
  it { should have_many :events }
  it { should have_many :seats }
end
