require 'rails_helper'

describe "As a guest user" do
  describe "when I visit '/'" do
    it "I can determine when it is most likely for me to already be dead in the past and living as a ghost" do
      visit '/'

      fill_in "start_date", with: "1 January, 2018"
      fill_in "end_date", with: "7 January, 2018"
      click_on "Determine Most Dangerous Day"

      expect(current_path).to eq('/most_dangerous_day')
      expect(page).to have_content("Most Dangerous Day")
      expect(page).to have_content("January 1, 2018 - January 7, 2018")
    end
  end
end
