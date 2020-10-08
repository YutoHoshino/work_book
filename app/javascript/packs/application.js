// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
import 'bootstrap';
import '../stylesheets/application';


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)




$(document).on('turbolinks:load', ()=> {

  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-field_group">
                    <input class="js_file form-control" type="text"
                    name="question[question_similars_attributes][${index}][similar_word]"
                    id="question_question_similars_attributes_${index}_similar_word"><br>
                  </div>`;
    return html;
  }


  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.form_similar').on('click', '#similar_box', function(e) {
    $('.form_similar').append(buildFileField(fileIndex[0]));
    fileIndex.shift();

    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });


});