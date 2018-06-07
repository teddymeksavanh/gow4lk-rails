require 'rails_helper'

RSpec.describe Type, type: :model do
  it { should belong_to(:stroll) }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:color) }
end
