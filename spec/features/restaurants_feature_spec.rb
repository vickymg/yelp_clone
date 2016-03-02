require 'rails_helper'
require_relative 'web_spec_helper'


feature 'restaurants' do
  context 'no restaurants have been added' do
    before { sign_up }
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before { sign_up }
    before { Restaurant.create name: 'KFC'}
    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context 'creating restaurants' do
    before { sign_up }
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restaurants' do
    let!(:kfc) {Restaurant.create(name:'KFC')}

    scenario 'view restaurant profile' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end

      context 'an invalid restaurant' do
        before { sign_up }
        it 'does not let you submit a name that is too short' do
          visit '/restaurants'
          click_link 'Add a restaurant'
          fill_in 'Name', with: 'kf'
          click_button 'Create Restaurant'
          expect(page).not_to have_css 'h2', text: 'kf'
          expect(page).to have_content 'error'
        end
      end

  end

  context 'editing restaurants' do
    before { create_restaurant }
    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit Dominoes'
      fill_in 'Name', with: 'Dominoes Pizza'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Dominoes Pizza'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'deleting restaurants' do
    before { create_restaurant }

    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete Dominoes'
      expect(page).not_to have_content 'Dominoes'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end
end
