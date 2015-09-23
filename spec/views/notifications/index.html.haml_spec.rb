require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :title => "Title",
        :content => "Content",
        :sender_id => 1,
        :receiver_id => 2
      ),
      Notification.create!(
        :title => "Title",
        :content => "Content",
        :sender_id => 1,
        :receiver_id => 2
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
