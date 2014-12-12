feature 'Visitor wants to improve the page' do
  scenario 'they click the improve this page link' do
    visit root_path
    click_link 'Improve this page'

    expect(page.current_url).to eql feedback.root_url(locale: :en)
  end

  scenario 'they click the improve Account page link' do
    visit root_path
    click_link 'Improve Account page'

    expect(page.current_url).to eql feedback.root_url(source: 'account', locale: :en)
  end

  scenario 'they click the improve Home page link' do
    visit root_path
    click_link 'Improve Home page'

    expect(page.current_url).to eql feedback.root_url(source: 'home', locale: :en)
  end
end
