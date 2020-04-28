// document.addEventListener("DOMContentLoaded", function (){
//   $("td .btn").click(function() {
//     $(this).css({
//       "background-color": "red",
//       "border-color": "red",
//       "color": "white",
//       "border-style": "none"
//     });
//
//       if ($(this).text()=== "Postular") {
//         $(this).text("Despostular")
//       }else{
//         $(this).text("Postular")
//         $(this).css({
//           "background-color": "#28A745",
//           "border-style": "none"
//
//         });
//       }
//   });
// });



(function() {
  'use strict';
  window.addEventListener('turbolinks:load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
