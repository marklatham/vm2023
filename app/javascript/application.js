// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@fortawesome/fontawesome-free"
import "flowbite"
import 'jquery';
import 'rails-ujs';
import 'datatables';

window.$ = window.jQuery = jQuery

$(document).ready(function() {
  $('#datatable').DataTable({
    order: [[0, 'desc']],
    paging: false,
    searching: false,
    info: false,
  });
});
