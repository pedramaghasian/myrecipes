



import consumer from "./consumer"

function scrollToBottom() {
  if($('#messages').length > 0) {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
}


consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the roommmmm!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

      
    $('#messages').append(data['message'])
    $('#message-content').val('')
    scrollToBottom();
    return

    
   
  }

});

jQuery(document).on('turbolinks:load') , 
  scrollToBottom()
  


  





























