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
import { initMapbox } from '../plugins/init_mapbox';
import "bootstrap-daterangepicker";
const moment = require('moment')

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  $('.dropdown-toggle').dropdown()
  function cb(start, end) {
    document.getElementById("start_day").value = start.date();
    document.getElementById("start_month").value = start.month() + 1;
    document.getElementById("start_year").value = start.year();

    document.getElementById("end_day").value = end.date();
    document.getElementById("end_month").value = end.month() + 1;
    document.getElementById("end_year").value = end.year();

    $('#reportrange span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'));
  }

  let $input = $('#reportrange');
  let calendarDataDiv = document.querySelector('#calendar-data');

  if (calendarDataDiv) {
    let calendarData = calendarDataDiv.dataset;
    let start = moment(calendarData.startDate, "MM DD YYYY");
    let end = start.add(1, 'days');

    $input.daterangepicker({
      startDate: start,
      endDate: end,
      minDate: start,
      maxDate: moment(calendarData.endDate, "MM DD YYYY"),
      locale: {
        applyLabel: "Save",
        cancelLabel: "Clear dates"
      },
      alwaysShowCalendars: true,
      autoUpdateInput: true
    }, cb);

    cb(start, end);

    $input.click();
  }

});
