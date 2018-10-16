$(document).ready(function () {
  var $form = $('#mailchimp_form');
  $form.submit(function(event){
    event.preventDefault();
    register($form);
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
      $('input[type=submit]', $form).val('Subscrever')
      if (data.result === 'success') {
        // Yeahhhh Success
        $form.replaceWith(
          $('<p>E-mail registado com sucesso</p>')
        );
      } else {
        // Something went wrong, do something to notify the user.
        $form.replaceWith(
          $('<p>Erro a registar e-mail</p>')
        );
      }
    }
  })
};
