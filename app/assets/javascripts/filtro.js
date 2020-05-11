
  window.addEventListener('turbolinks:load', function(){

    $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
    })

    setTimeout(function() {
    $('.alert').fadeOut();
  }, 3000);

    let input = document.querySelector("input[name=q]");
    input.addEventListener("keyup", function(){
      $.ajax({
        url: '/users/press_conferences',
        type: 'GET',
        dataType: 'script',
        data: {q: $(this).val()}
      })
      .done(function() {
        console.log("success");
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });

    })



  })
