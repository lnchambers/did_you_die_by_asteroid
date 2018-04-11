require 'rails_helper'

describe "As a guest user" do
  describe "when I visit '/'" do
    it "I can determine when it is most likely for me to already be dead in the past and living as a ghost" do
      visit '/'

      fill_in "start_date", with: "2018-01-01"
      fill_in "end_date", with: "2018-01-07"
      click_on "Determine Most Dangerous Day"

      expect(current_path).to eq('/most_dangerous_day')
      expect(page).to have_content("MOST DANGEROUS DAY")
      expect(page).to have_content("January 01, 2018 - January 07, 2018")
      expect(page).to have_content("January 01, 2018 has 3 potentially dangerous near earth objects")

      expect(page).to have_content("Name: (2014 KT76)")
      expect(page).to have_content("NEO Reference ID: 3672906")

      expect(page).to have_content("Name: (2001 LD)")
      expect(page).to have_content("NEO Reference ID: 3078262")

      expect(page).to have_content("Name: (2017 YR1)")
      expect(page).to have_content("NEO Reference ID: 3794979")
    end
  end
end
