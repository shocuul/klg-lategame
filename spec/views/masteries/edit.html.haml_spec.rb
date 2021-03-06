require 'spec_helper'

describe "masteries/edit" do
  before(:each) do
    @mastery = assign(:mastery, stub_model(Mastery,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit mastery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mastery_path(@mastery), "post" do
      assert_select "input#mastery_name[name=?]", "mastery[name]"
      assert_select "textarea#mastery_description[name=?]", "mastery[description]"
    end
  end
end
