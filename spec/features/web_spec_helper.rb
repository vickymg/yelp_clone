def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_diff_user
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test2@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def create_restaurant
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  click_link('Add a restaurant')
  fill_in 'Name', with: 'Dominoes'
  click_button 'Create Restaurant'
end

def review_restaurant
  click_link('Review Dominoes')
  fill_in('Thoughts', with: 'Good!')
  click_button('Leave Review')
end

def another_user_creates_restaurant
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test2@example.com')
  fill_in('Password', with: '12345678')
  fill_in('Password confirmation', with: '12345678')
  click_button('Sign up')
  click_link('Add a restaurant')
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
  click_link('Sign out')
end

def leave_review(thoughts, rating)
  visit '/restaurants'
  click_link 'Review Dominoes'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
