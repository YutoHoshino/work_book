document.addEventListener('DOMContentLoaded', () => {
  $(function () {

    $('.js-form').on('submit', function(e) {
      e.preventDefault();


      //#変数に答えのIDと問題のIDを取得
      let answer = $("input[name='question']:checked").val().replace(/[^0-9]/g, '');
      let question = $('.hidden').val();


      


      $.ajax({
        type: 'GET',
        url: '/tests/new',
        data: {

        },
        datatType: 'json'
      })
      .done(function() {



        $('.form__submit').attr('disabled', false);
        alert('sucsess');
      })
      .fail(function() {
        alert('error');
      });
    });
  });
});