require 'spec_helper'

describe 'the home page' do
  it 'says hello' do
    visit root_path

    expect(page).to have_content 'HELLO'
  end
end