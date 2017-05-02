require 'test_helper'

describe Channel do
  it "Requires 2 arguments to initialize" do
    proc {
      Channel.new
    }.must_raise ArgumentError

    proc {
      Channel.new "name"
    }.must_raise ArgumentError

  end

  it "Can create a Channel instance" do
    channel = Channel.new "Name", "id"

    channel.class.must_equal Channel
  end

  it "Can create a Channel with optional params" do
    channel = Channel.new("Name", "id", {
      purpose: "Show how to test!"
      })

    channel.class.must_equal Channel
    channel.purpose.must_equal "Show how to test!"
  end












  it "Has the accessor methods" do

  end












end
