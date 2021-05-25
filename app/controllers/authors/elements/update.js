

let element = document.getElementById('element-<%= element.id %>-form')
  
element.classList.add('d-none')
element.previousElementSibling.classList.remove('d-none')

var html = "<div class='trix-content'><%= @element.content.body.html_save %></div>"

element.previousElementSibling.innerHTML = html