require 'rails_helper'

RSpec.feature "Creating Articles" do

  
  before do
    @john = User.create!(email: "example@example.com", password: "password")

  visit "/"

 click_link "Log in"
 fill_in "Email", with: @john.email
 fill_in "Password", with: @john.password
 click_button "Log in"
end

  scenario "A user creates a new aritcle" do
    visit "/"

    click_link "New Article"

    fill_in "Title", with: "Creating first article"
    fill_in "Body", with: "Lorem impsum"
    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)

  end

  scenario "A user fails to create a new article" do
    visit "/"

    click_link "New Article"

    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"

    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")


  end
end