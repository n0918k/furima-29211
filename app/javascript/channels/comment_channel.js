import consumer from "./consumer"
consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const html = `  <div class= "comment-items">

    <div class="c-user-name"><${data.user.nickname}さん></div>

    <div class="c-text"> ${data.content.text}</div>`;
    const messages = document.getElementById('comment-text');
    const newMessage = document.getElementById('comment_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
