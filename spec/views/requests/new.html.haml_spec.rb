require 'spec_helper'

describe "requests/new" do
  before(:each) do
    assign(:request, stub_model(Request,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", requests_path, "post" do
      assert_select "input#request_name[name=?]", "request[name]"
      assert_select "input#request_email[name=?]", "request[email]"
    end
  end
end
