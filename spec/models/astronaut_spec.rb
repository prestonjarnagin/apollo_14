require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  it 'can calculate an astronauts total time in space' do
    astronaut = Astronaut.create(name: 'Neil', age: 60, job: 'commander')
    astronaut.missions.create(title: 'Capricorn 4', time_in_space: 20)
    astronaut.missions.create(title: 'Apollo 13', time_in_space: 21)

    expect (astronaut.total_time_in_space).to eq(41)
  end
end
