$(function() {  
    //nav functions/////////////////////////////////////////////////////////////
    //clicking navigation button "All Vendors"
    $( "#nav_all" ).click(function() {
      $("#services_search").hide();
      $("#booth_search").hide();
      $("#nav_all_li").addClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").removeClass("active");
      $("#Vendors tbody tr").each(function(){ $(this).show(); });
    });
    //clicking navigation button "Booth Preference"
    $( "#nav_booth" ).click(function() {
      $("#booth_search").show();
      $("#services_search").hide();
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").addClass("active");
      $("#nav_services_li").removeClass("active");
    });
    //clicking navigation button "Services"
    $( "#nav_services" ).click(function() {
      $("#services_search").show();
      $("#booth_search").hide();
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").addClass("active");
    });
    
    
    //vendor popup functions////////////////////////////////////////////////////
    //clicking on vendor link
    $(".vendor_link").click(function() {
        $.ajax({
            type: "GET",
            url: "/vendors/"+$(this).attr("id"),
            success: function(result) {
              var oneFourth = Math.ceil($(window).width()/4);
              $("#individual").html(result).
              css({'left': oneFourth, 'top': "100px", 'width': oneFourth*2, 'position': 'absolute'}).
              show();
              $('#close_individual').click(function() {
                $("#individual").hide();
              })
            }
        }); 
    });
    //clicking outside of vendor popup
    $(document).mouseup(function (e)
      {
          var container = $("#individual");
          if (!container.is(e.target) // if the target of the click isn't the container...
              && container.has(e.target).length === 0) // ... nor a descendant of the container
          {
              container.hide();
          }
      });
      
      
    //sorting functions/////////////////////////////////////////////////////////
    $(".sorter").change(function() {
      $("#Vendors tbody tr").each(function(){ $(this).hide(); });
      
      $('.sorter').each(function() {
        //filter by ext_chairs
        if ($(this).attr("id") == "ext_chairs")
          $("#Vendors thead tr").find("ext_chairs").show()
          $("#Vendors thead tr").find("chair_cost").show()
          $("#Vendors thead tr").find("service_cost").show()
          
          $("#Vendors tbody tr").each(function(){ 
            if ($(this).find("#ext_chairs").html() != 0)
              $(this).show();
          });
          
        //filter by ext_tables
        if ($(this).attr("id") == "ext_tables")
          $("#Vendors tbody tr").each(function(){ 
            if ($(this).find("#ext_tables").html() != 0)
              $(this).show();
          });
          
      });
      
    });
});