require 'spec_helper'

feature 'viewing submitted and recieved requests' do

  before(:each) do
    owner = User.create(name: 'name',
      email: 'test@test.com',
      password: 'password',
      password_conf: 'password'
    )
    rentee = User.create(name: 'person',
      email: 'person@test.com',
      password: 'password',
      password_conf: 'password'
    )

@file = cabintest.png

    File.open("./app/public/uploads/#{@file}", "wb") do |f|
       f.write(file.read)
    end

    space = owner.spaces.create(name: 'name',
      description: 'description',
      price: 90.00,
      available_from: '2017-02-10',
      available_to: '2017-02-11',
      image: @file
    )
    request = space.requests.create(date_requested: '2017-02-10', user: rentee)
  end

  scenario 'requests made has correct details' do
    sign_in('person@test.com', 'password')

    visit '/requests/view'
    within '.requests_received_box' do
      expect(page).to have_content('Date Requested: 10 February, 2017')
      expect(page).to have_content('Status: Pending')
    end
  end

  scenario 'requests received has correct details' do
    sign_in('test@test.com', 'password')

    visit '/requests/view'
    within '.requests-made' do
      expect(page).to have_content('Date Requested: 10 February, 2017')
      expect(page).to have_content('Status: Pending')
    end
  end

end
