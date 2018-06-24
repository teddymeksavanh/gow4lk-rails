require 'rails_helper'

RSpec.describe Stroll, type: :model do
  it { should have_many(:paths).dependent(:destroy) }
  it { should have_many(:types).dependent(:destroy) }
    
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:length) }
  it { should validate_presence_of(:created_date) } 
end
