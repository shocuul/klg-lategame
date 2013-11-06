require 'spec_helper'

describe "masteries/new" do
  before(:each) do
    assign(:mastery, stub_model(Mastery,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new mastery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", masteries_path, "post" do
      assert_select "input#mastery_name[name=?]", "mastery[name]"
      assert_select "textarea#mastery_description[name=?]", "mastery[description]"
    end
  end
end
