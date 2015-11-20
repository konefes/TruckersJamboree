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
      $("#contact_name_heading").show();
      $("#phone_heading").show();
      $("#contact_name").show();
      $("#phone").show();
      
      $("#Vendors thead tr").find("#ext_chairs_heading").hide();
      $("#Vendors tbody td").find("#ext_chairs").hide();
      $("#Vendors thead tr").find("#chair_cost_heading").hide();
      $("#Vendors tbody td").find("#chair_cost").hide();
      
      $("#Vendors thead tr").find("#ext_tables_heading").hide();
      $("#Vendors tbody td").find("#ext_tables").hide();
      $("#Vendors thead tr").find("#table_cost_heading").hide();
      $("#Vendors tbody td").find("#table_cost").hide();
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
    //clicking outside of vendor popup to close
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
      $("#contact_name_heading").hide();
      $("#phone_heading").hide();
      
      $("#Vendors tbody tr").each(function(){ 
        $(this).hide(); 
        $(this).find("#contact_name").hide();
        $(this).find("#phone").hide();
      });
      
      //checkbox in services tab clicked
      if ($("#nav_services_li").hasClass("active")) {
        $("#service_cost_heading").show();
        $("#booth_cost_heading").show();
        $("#Vendors tbody tr").each(function(){ 
          $(this).find("#service_cost").show(); 
          $(this).find("#booth_cost").hide();
        });
      }
      
      //iterate through all checkboxes
      $('.sorter').each(function() {
        
        //filter by ext_chairs
        if ($(this).attr("id") == "filter_ext_chairs" && $(this).is(":checked")){
          //alert("checked");
          $("#ext_chairs_heading").show();
          $("#chair_cost_heading").show();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#ext_chairs").show();
            $(this).find("#chair_cost").show();
            if ($(this).find("#ext_chairs").html() != 0)
              $(this).show();
          });
        }else if ($(this).attr("id") == "filter_ext_chairs" && !$(this).is(":checked")){
          $("#ext_chairs_heading").hide();
          $("#chair_cost_heading").hide();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#ext_chairs").hide();
            $(this).find("#chair_cost").hide();
          });
        }
        //end ext_chairs
          
        //filter by ext_tables
        if ($(this).attr("id") == "filter_ext_tables" && $(this).is(":checked")){
          //alert("checked");
          $("#ext_tables_heading").show();
          $("#table_cost_heading").show();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#ext_tables").show();
            $(this).find("#table_cost").show();
            if ($(this).find("#ext_tables").html() != 0)
              $(this).show();
          });
        }else if ($(this).attr("id") == "filter_ext_tables" && !$(this).is(":checked")){
          $("#ext_tables_heading").hide();
          $("#table_cost_heading").hide();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#ext_tables").hide();
            $(this).find("#table_cost").hide();
          });
        }
        //end ext_tables
        
        //filter by electric
        if ($(this).attr("id") == "filter_electric" && $(this).is(":checked")){
          //alert("checked");
          $("#electric_heading").show();
          $("#electric_cost_heading").show();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#electric").show();
            $(this).find("#electric_cost").show();
            if ($(this).find("#electric").html() != 0)
              $(this).show();
          });
        }else if ($(this).attr("id") == "filter_electric" && !$(this).is(":checked")){
          $("#electric_heading").hide();
          $("#electric_cost_heading").hide();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#electric").hide();
            $(this).find("#electric_cost").hide();
          });
        }
        //end electric
        
        //filter by service_description
        if ($(this).attr("id") == "filter_service_description" && $(this).is(":checked")){
          //alert("checked");
          $("#service_description_heading").show();;
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#service_description").show();
            if ($(this).find("#service_description").html() != 0)
              $(this).show();
          });
        }else if ($(this).attr("id") == "filter_service_description" && !$(this).is(":checked")){
          $("#service_description_heading").hide();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#service_description").hide();
          });
        }
        //end service_description
          
      });//end checkbox iterator
      
    });//end checkbox change function
});