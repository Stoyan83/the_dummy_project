require "rails_helper"

RSpec.describe "pages/edit", type: :view do
  let(:page) do
    Page.create!(
      first_name: "MyString",
      last_name: "MyString",
      about: "MyText"
    )
  end

  before(:each) do
    assign(:page, page)
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(page), "post" do
      assert_select "input[name=?]", "page[first_name]"

      assert_select "input[name=?]", "page[last_name]"

      assert_select "textarea[name=?]", "page[about]"
    end
  end
end
