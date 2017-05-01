require 'httparty'

class SlackApiWrapper
  BASE_URL = "https://api.slack.com/api/"
  TOKEN = ENV["SLACK_TOKEN"]

  def self.getChannel(id)
    url = BASE_URL + "channels.info?" + "token=#{TOKEN}&channel=#{id}"
    response = HTTParty.get(url)
    return Channel.new(response["channel"]["name"], response["channel"]["id"])
  end

  def self.sendMessage(channel_id, text, token = nil)
    token ||= TOKEN

    url = BASE_URL + "chat.postMessage?" +  "token=#{token}&"

    response = HTTParty.post(url,
      body: {
        "text" => "#{text}",
        "channel" => "#{channel_id}",
        "username" => "CheezItBot",
        "icon_emoji" => ":robot_face:",
        "as_user" => "false"
      },
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )

    return response["ok"]

  end

  # def self.sendMessage(channel_id, text)
  #   url = BASE_URL + "chat.postMessage?" +  "token=#{TOKEN}&" + "channel=#{channel_id}&" + "text=#{text}"
  #
  #   response = HTTParty.get(url)
  #
  #   return response["ok"]
  #
  # end

  def self.listChannels
    url = BASE_URL + "channels.list?" + "token=#{TOKEN}"

    response = HTTParty.get(url)

    channels = []
    response["channels"].each do |channel|
      id = channel["id"]
      name = channel["name"]
      channels << Channel.new(name, id)
    end

    return channels


  end


end
