require 'spec_helper'

describe "requests/index" do
  before(:each) do
    assign(:requests, [
      stub_model(Request,
        :name => "Name",
        :email => "Email"
      ),
      stub_model(Request,
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
