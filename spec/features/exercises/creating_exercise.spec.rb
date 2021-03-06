require "rails_helper"

RSpec.feature "Creating Exercise" do
  before do
    @email = "john@example.com"
    @password = "password"
    @john = User.create!(email: @email, password: @password)
    login_as(@john)
  end

  scenario "with valid inputs" do
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link "Back"

    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Weight lifting"
    fill_in "Activity date", with: "2020-01-01"
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")

    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@john, exercise))
    expect(exercise.user_id).to eq(@john.id)
  end
end