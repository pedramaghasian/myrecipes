import consumer from "./consumer"

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the comments!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#messages').prepend(data)
    // $('#messages').prepend(data)
    console.log("Recieving:")
    console.log(data.content)
  }
});

