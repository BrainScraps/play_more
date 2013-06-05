$(document).ready(function(){

   $("#moviebtn").click(function(event){
  event.preventDefault();
   param = $("#moviebox").val(); 
   $.ajax({type: "GET", url: "/movies/"+ param}).done(function(html){
    $("#modalbod").html(html);
    $("#mymodal").modal("show");

    $("#moviebox").val(""); 

   });
     
   })

   $("#stocksbtn").click(function(event){
  event.preventDefault();
   param = $("#stocksbox").val(); 
   $.ajax({type: "GET", url: "/stocks/"+ param}).done(function(html){
    $("#modalbod").html(html);
    $("#mymodal").modal("show");

    $("#stocksbox").val(""); 

   });
     
   })

   $("#imagebtn").click(function(event){
  event.preventDefault();
   param = $("#imagebox").val(); 
   $.ajax({type: "GET", url: "/images/"+ param}).done(function(html){
    $("#modalbod").html(html);
    $("#mymodal").modal("show");

    $("#imagebox").val(""); 

   });
     
   })
});
