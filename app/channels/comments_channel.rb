
# this channel created by : rails generate channel comments
class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments_channel"
    # stream_from "comments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end