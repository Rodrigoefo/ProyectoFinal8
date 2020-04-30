
  window.addEventListener('turbolinks:load', function(){
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
