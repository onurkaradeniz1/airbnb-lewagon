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


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "bootstrap-daterangepicker";
const moment = require('moment')

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { autocomplete } from "../components/search";


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  $('.dropdown-toggle').dropdown()
  let start = moment().subtract(29, 'days');
  let end = moment();

  function cb(start, end) {
    //$('#reportrange span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'));
  }

  let $input = $('#reportrange');

  $input.daterangepicker({
    startDate: start,
    endDate: end,
    alwaysShowCalendars: true
  }, cb);

  cb(start, end);

  $input.click();

});

const addressInput = document.getElementById('search-input');

addressInput.addEventListener('keyup', () => {
  autocomplete();
})
