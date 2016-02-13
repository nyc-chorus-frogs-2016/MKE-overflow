
require 'rails_helper'

RSpec.describe User do
it "user should have a username and password on creation" do
    user = User.new
    user.username   = "kerry"
    user.password = "123"
    user.save
   expect(user.class).to eq User
  end


end
