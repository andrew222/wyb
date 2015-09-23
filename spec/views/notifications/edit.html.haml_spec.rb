require 'rails_helper'

RSpec.describe "notifications/edit", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :title => "MyString",
      :content => "MyString",
      :sender_id => 1,
      :receiver_id => 1
    ))
  end

  it "renders the edit notification form" do
    render

    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do

      assert_select "input#notification_title[name=?]", "notification[title]"

      assert_select "input#notification_content[name=?]", "notification[content]"

      assert_select "input#notification_sender_id[name=?]", "notification[sender_id]"

      assert_select "input#notification_receiver_id[name=?]", "notification[receiver_id]"
    end
  end
end
