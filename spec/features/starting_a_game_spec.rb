  require 'spec_helper'

  feature 'Starting a new game' do
    scenario 'I am asked to enter my name' do
      visit '/'
      click_link 'New Game'
      expect(page).to have_content "What's your name?"
    end

    scenario 'I am presented with a new board' do
      visit '/new_game'
      click_button 'Start'
      expect(page.find(:css,'#board'))
    end

    scenario 'when I am presented with a new board' do
      visit '/new_game'
      fill_in('name', :with => 'philip')
      click_button 'Start'
      expect(page).to have_content 'hello philip - Welcome to Battleships'
    end

    
  end
