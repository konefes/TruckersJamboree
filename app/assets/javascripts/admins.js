$(function() {  
    $( "#nav_all" ).click(function() {
      $("#services_search").hide();
      $("#booth_search").hide();
      $("#nav_all_li").addClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").removeClass("active");
    });
    
    $( "#nav_booth" ).click(function() {
      $("#booth_search").show();
      $("#services_search").hide();
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").addClass("active");
      $("#nav_services_li").removeClass("active");
    });
    
    $( "#nav_services" ).click(function() {
      $("#services_search").show();
      $("#booth_search").hide();
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").addClass("active");
    });
    
    
    
    
    $(".vendor_link").click(function() {
        //alert($(this).attr("id"));
        $.ajax({
            type: "GET",
            url: "/vendors/"+$(this).attr("id"),
            //data: $(this).attr("id"),
            success: function(result) {$("#individual").html(result);}
        }); 
        $("#individual").show();
    });
    
    $( "#close_individual" ).click(function() {
        alert("butt");
      $("#individual").hide();
    });
});