
class HomepagesController < ApplicationController
  def index
    @channels = SlackApiWrapper.listChannels

  end

  def create
    it_worked = SlackApiWrapper.sendMessage(params[:channel], params[:message])

    if it_worked
      redirect_to root_path
    end

  end

  def new
    @channel = SlackApiWrapper.getChannel(params[:channel])

    @channel_id = params[:channel]
  end
end
