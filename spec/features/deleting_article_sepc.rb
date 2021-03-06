require 'rails_helper'

RSpec.feature "Destroy an article" do

    before do
      @article = Article.create(title: "Title of Article", body: "Body of article")
    end

  scenario 'A user Delete an article' do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)

  end
end