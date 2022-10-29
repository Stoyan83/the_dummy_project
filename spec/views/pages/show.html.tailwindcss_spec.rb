require 'rails_helper'

RSpec.describe "pages/show", type: :view do
  before(:each) do
    assign(:page, Page.create!(
      first_name: "First Name",
      last_name: "Last Name",
      about: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/MyText/)
  end
end
