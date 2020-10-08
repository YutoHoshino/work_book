document.addEventListener('DOMContentLoaded', () => {

  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-field_group">
                    <input class="js_file" type="text"
                    name="question[question_similars_attributes][${index}][similar_word]"
                    id="question_question_similars_attributes_${index}_similar_word"><br>
                    <div class="similar_box">追加</div>
                  </div>`;
    return html;
  }


  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.form-group').on('click', '#similar_box', function(e) {
    $('.form-group').append(buildFileField(fileIndex[0]));
    fileIndex.shift();

    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });


});