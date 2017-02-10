module SessionHelpers
  def sign_up(name, email, password, password_conf)
    visit ('/users/new')
    fill_in 'name', with: name
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_conf', with: password_conf
    click_button 'Sign Up'
  end

  def sign_in(email, password)
    visit ('/sessions/new')
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Login'
  end
end

def sign_up_true
  visit ('/users/new')
  fill_in 'name', with: 'Betty'
  fill_in 'email', with: 'betty@bettymail.com'
  fill_in 'password', with: 'password'
  fill_in 'password_conf', with: 'password'
  click_button 'Sign Up'
end

def change_user
  click_button('Logout')
  sign_up('Bob', 'bob@bobmail.com', 'password', 'password')
  sign_in('bob@bobmail.com', 'password')
end

def list_space_one
  click_link('Yes, please')
  fill_in(:name, with: 'House by the sea')
  fill_in(:description, with: 'Lovely two-bed apartment overlooking the sea.')
  fill_in(:price, with: '35.00')
  fill_in(:available_from, with:'2017-02-24')
  fill_in(:available_to, with:'2017-02-25')
  attach_file('file', File.absolute_path('./app/public/images/cabintest.png'))
  click_button('List space')
end

def list_another_space_one
  click_link('Yes, please')
  fill_in(:name, with: 'Penthouse apartment')
  fill_in(:description, with: 'Incredible views from this top storey apartment in London')
  fill_in(:price, with: '100.00')
  fill_in(:available_from, with:'2017-02-24')
  fill_in(:available_to, with:'2017-02-25')
  attach_file('file', File.absolute_path('./app/public/images/cabintest.png'))
  click_button('List space')
end

def create_spaces
  user = User.create(name: 'name',
  email: 'test@test.com',
  password: 'password',
  password_conf: 'password')
  @space = user.spaces.create(name: 'House by the sea', description: 'Lovely two-bed apartment overlooking the sea.', price: 35.00, available_from: '2017-02-10', available_to: '2017-02-11')
  @space = user.spaces.create(name: 'Penthouse apartment', description: 'Incredible views from this top storey apartment in London', price: 100.00, available_from: '2017-02-10', available_to: '2017-02-11')
end
