RSpec.describe Language, type: :model do
  it { should belong_to(:user).dependent(:destroy) }

  it { should validate_presence_of(:name)}
end
