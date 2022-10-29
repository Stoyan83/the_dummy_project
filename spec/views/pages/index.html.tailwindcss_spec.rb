require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        first_name: "First Name",
        last_name: "Last Name",
        about: "MyText"
      ),
      Page.create!(
        first_name: "First Name",
        last_name: "Last Name",
        about: "MyText"
      )
    ])
  end

  it "renders a list of pages" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
