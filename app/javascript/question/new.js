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