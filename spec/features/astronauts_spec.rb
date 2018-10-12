require 'rails_helper'

describe 'astronauts index' do
  it 'shows information about astronauts' do
    Astronaut.create(name: 'Neil', age: 37, job: 'commander')
    Astronaut.create(name: 'Tom', age: 40, job: 'engineer')

    visit '/astronauts'
    expect(page).to have_content('Name: Neil')
    expect(page).to have_content('Name: Tom')
    expect(page).to have_content('Age: 37')
    expect(page).to have_content('Age: 40')
    expect(page).to have_content('Job: commander')
    expect(page).to have_content('Job: engineer')
  end

  it 'shows information about average astronaut age' do
    Astronaut.create(name: 'Neil', age: 60, job: 'commander')
    Astronaut.create(name: 'Tom', age: 40, job: 'engineer')

    visit '/astronauts'
    expect(page).to have_content('Average Age: 50')
  end

  it 'shows each astronauts missions' do
    astronaut = Astronaut.create(name: 'Neil', age: 60, job: 'commander')
    astronaut.missions.create(title: 'Capricorn 4', time_in_space: 20)
    astronaut.missions.create(title: 'Apollo 13', time_in_space: 21)
    visit '/astronauts'
    expect(page).to have_content('Apollo 13, Capricorn 4')
  end
end
