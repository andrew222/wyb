require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :title => "MyString",
      :content => "MyString",
      :sender_id => 1,
      :receiver_id => 1
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input#notification_title[name=?]", "notification[title]"

      assert_select "input#notification_content[name=?]", "notification[content]"

      assert_select "input#notification_sender_id[name=?]", "notification[sender_id]"

      assert_select "input#notification_receiver_id[name=?]", "notification[receiver_id]"
    end
  end
end
