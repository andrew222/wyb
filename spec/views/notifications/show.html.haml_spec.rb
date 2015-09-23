require 'rails_helper'

RSpec.describe "notifications/show", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :title => "Title",
      :content => "Content",
      :sender_id => 1,
      :receiver_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
