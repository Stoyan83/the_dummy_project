require 'rails_helper'

RSpec.describe "pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new(
      first_name: "MyString",
      last_name: "MyString",
      about: "MyText"
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "input[name=?]", "page[first_name]"

      assert_select "input[name=?]", "page[last_name]"

      assert_select "textarea[name=?]", "page[about]"
    end
  end
end
