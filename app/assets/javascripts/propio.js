document.addEventListener("DOMContentLoaded", function (){
  $("td .btn").click(function() {
    $(this).css({
      "background-color": "red",
      "border-color": "red",
      "color": "white",
      "border-style": "none"
    });

      if ($(this).text()=== "Postular") {
        $(this).text("Despostular")
      }else{
        $(this).text("Postular")
        $(this).css({
          "background-color": "#28A745",
          "border-style": "none"

        });
      }
  });
});
