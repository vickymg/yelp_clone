require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do

    it 'should see a sign in link and a sign up link' do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
     visit('/')
     expect(page).not_to have_link('Sign out')
    end

    it "should not be able to create restaurants" do
      visit('/')
      click_link('Add a restaurant')
      expect(current_path).not_to eq('/restaurants')
    end

  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end
    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    context "user can edit, delete and review restaurants" do
      it "can only edit restaurants they have created" do

      end

      it "can only delete restauranats they have created" do

      end

      it "can only review each restaurant once" do

      end

      it "can only delete their own reviews" do

      end
    end
  end

end
