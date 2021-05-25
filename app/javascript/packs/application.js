// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


require("trix")
require("@rails/actiontext")

import Sortable from 'sortablejs';

import '../stylesheet/application';
import "@fortawesome/fontawesome-free/js/all";


document.addEventListener('turbolinks:load', () => {
    document.addEventListener('click', () => {
      let element = event.target.closest('.content')
      if (!element) return;
  
      element.classList.add('d-none')
      element.nextElementSibling.classList.remove('d-none')
    })
  
    document.addEventListener('click', () => {
      if (!event.target.matches('.cancel')) return;
      event.preventDefault()
  
      event.preventDefault();
  
      let element = event.target.closest('.form')
  
      element.classList.add('d-none')
      element.previousElementSibling.classList.remove('d-none')
    })
    let element = document.getElementById('elements')
    Sortable.create(element, {animation: 150})
  })
  

import "controllers"


