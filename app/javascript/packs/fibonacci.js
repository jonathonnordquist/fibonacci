$(document).ready(() => {
  $('.form_submit').on('click', (e) => {
    e.preventDefault();
    const target = $('.target_number').val();
    $.ajax({
      url: `/fibonacci/index?target=${target}`,
      dataType: 'json'
    })
    .done(data => $('.display-area').html(data.sequence))
    .fail(() => console.log('error'));
  })
});


// ;
