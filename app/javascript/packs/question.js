document.addEventListener('DOMContentLoaded', () => {
  $(function () {
    $('.js-form').on('submit', function(e) {
      e.preventDefault();
      let answer = $("input[name='question']:checked").val().replace(/[^0-9]/g, '');
      let question = $('.hidden').val();

      console.log(answer)
      console.log(question)

      $.ajax({
        type: 'GET',
        url: '/tests/new',
        datatType: 'json'
      })
      .done(function() {
        alert('sucsess');
      })
      .fail(function() {
        alert('error');
      });
    });
  });
});