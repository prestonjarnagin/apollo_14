require 'rails_helper'

describe 'astronauts index' do
  it 'shows information about astronauts' do
    Astronaut.create(name: 'Neil', age: 37, job: 'commander')

    visit '/astronauts'
    expect(page).to have_content('Name: Neil')
    expect(page).to have_content('Age: 37')
    expect(page).to have_content('Job: commander')
  end
end
