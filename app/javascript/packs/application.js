// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

// window.$ = $

// require('imports-loader?define=>false!datatables.net')(window, $)
// require('imports-loader?define=>false!datatables.net-bs4')(window, $)



// const dataTables = [];

// document.addEventListener("turbolinks:load", () => {
//   if (dataTables.length === 0 && $('.data-table').length !== 0) {
//     $('.data-table').each((_, element) => {
//       dataTables.push($(element).DataTable({
//         pageLength: 50
//       }));
//     });
//   }
// });

// document.addEventListener("turbolinks:before-cache", () => {
//   while (dataTables.length !== 0) {
//     dataTables.pop().destroy();
//   }
// });









// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
