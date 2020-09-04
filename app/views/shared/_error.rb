<% if @user_item.errors.any? %>
  <div class="error-alert">
    <ul>
      <% @user_item.errors.full_messages.each do |message| %>
      <li class='error-message'><%= message %></li>
      <% end %>
    </ul>
  </div>
  <% end %>