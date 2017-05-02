require 'test_helper'

describe SlackChannel do
  describe "initialize" do
    it "Takes a name" do
      name = "test channel"
      sc = SlackChannel.new(name)
      sc.name.must_equal name
    end

    it "Requires a name" do
      proc {
        SlackChannel.new
      }.must_raise ArgumentError
    end
  end

  describe "send" do
    it "Can send a message to a real channel" do
      VCR.use_cassette("channels") do
        channel = SlackChannel.new('queues_api_testing')
        channel.send("test message")
      end
    end

    it "Fails to send to a bogus channel" do
      VCR.use_cassette("channels") do
        channel = SlackChannel.new('this_channel_doesnt_exist')
        proc {
          channel.send("test message")
        }.must_raise SlackChannel::SlackException
      end
    end
  end

end
