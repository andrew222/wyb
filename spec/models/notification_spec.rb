RSpec.describe Notification, type: :model do
  it { should belong_to(:sender).class_name('User') }
  it { should belong_to(:sender).with_foreign_key('sender_id') }

  it { should belong_to(:receiver).class_name('User') }
  it { should belong_to(:receiver).with_foreign_key('receiver_id') }

  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:content)}
end
