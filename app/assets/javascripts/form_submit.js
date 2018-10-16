$(document).ready(function () {
  var $form = $('#mailchimp_form');
  $form.submit(function(event){
    event.preventDefault();
    register($form);
  });

  $('#new_talk_suggestion').submit(function(event){
    $('input[type=submit]', '#new_talk_suggestion').val('A gravar...');
  });
})

function register($form) {
  $('input[type=submit]', $form).val('A registar...');
  $.ajax({
    type: $form.attr('method'),
    url: $form.attr('action'),
    data: $form.serialize(),
    cache: false,
    dataType: 'json',
    contentType: 'application/json; charset=utf-8',
    error: function (err) { alert('Erro a ligar ao servidor.') },
    success: function (data) {
      $('input[type=submit]', $form).val('Subscrever');
      if (data.result === 'success') {
        // Yeahhhh Success
        $form[0].reset();
      } else {
        // Something went wrong, do something to notify the user.
        $form[0].reset();
      }
    }
  })
};
