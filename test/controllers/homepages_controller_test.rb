require 'test_helper'

describe HomepagesController do
  it "should get index" do
    VCR.use_cassette("slack") do
      get root_path
      must_respond_with :success
    end
  end

  it "should get new" do
    get new_message_path("C557BP9QE")
    must_respond_with :success
  end

  it "should post to create" do
    post create_message_path("C557BP9QE"), params: {"message" => "Hey testing!"}

    must_respond_with :redirect
    must_redirect_to root_path
  end

end
