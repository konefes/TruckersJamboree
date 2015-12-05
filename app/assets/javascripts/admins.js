$("#admins_index").ready(
$(function() {  
    //nav functions/////////////////////////////////////////////////////////////
    //clicking navigation button "All Vendors"
    $( "#nav_all" ).click(function() {
      $("#services_search").hide("normal");
      $("#booth_search").hide("normal");
      $("#nav_all_li").addClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").removeClass("active");
      $("#nav_contact_li").removeClass("active");
      $("#nav_whole_li").removeClass("active");
      $("#nav_add_li").removeClass("active");
      $("#nav_remove_li").removeClass("active");
      $("#add_vendor").hide("normal");
      $("#vendor_table").show("normal");
      $("#vendor_remove_table").hide("normal");
      clearBooth();
      clearServices();
      clearContact();
      clearWhole();
      $("#contact_name_heading").show();
      $("#phone_heading").show();
      $("#Vendors tbody tr").each(function(){ 
        $(this).find("#contact_name").show();
        $(this).find("#phone").show();
      });
      showAll();
    });
    //clicking navigation button "Booth Preference"
    $( "#nav_booth" ).click(function() {
      $("#booth_search").show("normal");
      $("#services_search").hide();
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").addClass("active");
      $("#nav_services_li").removeClass("active");
      $("#nav_contact_li").removeClass("active");
      $("#nav_whole_li").removeClass("active");
      $("#nav_add_li").removeClass("active");
      $("#nav_remove_li").removeClass("active");
      $("#add_vendor").hide("normal");
      $("#vendor_table").show("normal");
      $("#vendor_remove_table").hide("normal");
      clearServices();
      clearContact();
      clearWhole();
      $("#booth_cost_heading").show();
      $("#Vendors tbody tr").each(function(){ 
        $(this).find("#booth_cost").show();
      });
      showAll();
    });
    //clicking navigation button "Services"
    $( "#nav_services" ).click(function() {
      $("#services_search").show("normal");
      $("#booth_search").hide("normal");
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").addClass("active");
      $("#nav_contact_li").removeClass("active");
      $("#nav_whole_li").removeClass("active");
      $("#nav_add_li").removeClass("active");
      $("#nav_remove_li").removeClass("active");
      $("#add_vendor").hide("normal");
      $("#vendor_table").show("normal");
      $("#vendor_remove_table").hide("normal");
      clearBooth();
      clearContact();
      clearWhole();
      $("#service_cost_heading").show();
      $("#Vendors tbody tr").each(function(){ 
        $(this).find("#service_cost").show();
      });
      showAll();
    });
    //clicking contact button "Contact"
    $( "#nav_contact" ).click(function() {
      $("#services_search").hide("normal");
      $("#booth_search").hide("normal");
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").removeClass("active");
      $("#nav_contact_li").addClass("active");
      $("#nav_whole_li").removeClass("active");
      $("#nav_add_li").removeClass("active");
      $("#nav_remove_li").removeClass("active");
      $("#add_vendor").hide("normal");
      $("#vendor_table").show("normal");
      $("#vendor_remove_table").hide("normal");
      clearBooth();
      clearServices();
      clearWhole();
      showContact();
      showAll();
    });
    //clicking contact button "All entries"
    $( "#nav_whole" ).click(function() {
      $("#services_search").hide("normal");
      $("#booth_search").hide("normal");
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").removeClass("active");
      $("#nav_contact_li").removeClass("active");
      $("#nav_whole_li").addClass("active");
      $("#nav_add_li").removeClass("active");
      $("#nav_remove_li").removeClass("active");
      $("#add_vendor").hide("normal");
      $("#vendor_table").show("normal");
      $("#vendor_remove_table").hide("normal");
      clearBooth();
      clearServices();
      clearContact();
      showWhole();
      showAll();
    });
    //clicking contact button "Add Vendors"
    $( "#nav_add" ).click(function() {
      $("#services_search").hide("normal");
      $("#booth_search").hide("normal");
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").removeClass("active");
      $("#nav_contact_li").removeClass("active");
      $("#nav_whole_li").removeClass("active");
      $("#nav_add_li").addClass("active");
      $("#nav_remove_li").removeClass("active");
      $("#add_vendor").show("normal");
      $("#vendor_table").hide("normal");
      $("#vendor_remove_table").hide("normal");
      clearBooth();
      clearServices();
      clearContact();
      clearWhole();
      showAll();
    });
    //clicking contact button "Remove Vendors"
    $( "#nav_remove" ).click(function() {
      $("#services_search").hide("normal");
      $("#booth_search").hide("normal");
      $("#nav_all_li").removeClass("active");
      $("#nav_booth_li").removeClass("active");
      $("#nav_services_li").removeClass("active");
      $("#nav_contact_li").removeClass("active");
      $("#nav_whole_li").removeClass("active");
      $("#nav_add_li").removeClass("active");
      $("#nav_remove_li").addClass("active");
      $("#add_vendor").hide("normal");
      $("#vendor_table").hide("normal");
      $("#vendor_remove_table").show("normal");
      clearBooth();
      clearServices();
      clearContact();
      clearWhole();
      $("#phone_heading").show();
      $("#product_heading").show();
      $("#contact_name_heading").show();
      $("#Vendors tbody tr").each(function(){ 
        $(this).find("#product").show();
        $(this).find("#contact_name").show();
        $(this).find("#phone").show();
      });
      showAll();
    });
    
    $("#printWholePageButton").click(function(){
      var click = document.getElementById('click');
      var overflow = document.getElementById('scroller');
      overflow.style.overflow = 'visible';
      var fontS;
      click.style.visibility = 'hidden';
      var table = document.getElementById('Vendors');
      table.border = "1";
      fontS = table.style.fontSize;
      table.style.fontSize= "10px";
      var win = $('.tester').html();
      var w = window.open();
      w.document.write('<html>' + win + '</html>')
      w.print();
      w.close();
      overflow.style.overflow = 'auto';
      click.style.visibility = 'visible';
      table.border = "0";
      table.style.fontSize = fontS;
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
    
    //clicking on vendor remove link
    $(".vendor_remove_link").click(function() {
      //$(this).confirmation('show')
      var retVal = confirm("Do you want to remove this vendor?");
      if( retVal == true ){
        $.ajax({
            type: "GET",
            url: "/vendors/r"+ $(this).attr("id"),
        }); 
        setTimeout(function(){location.reload();},250); 
        return true;
      }
      else{
        return false;
      }
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
      
    //show all vendors
    function showAll() {
      $("#Vendors tbody tr").each(function(){ 
        $(this).show(); 
      });
    };
    
    
    //show all vendor data
    function showWhole(){
      $("#product_heading").show();
      $("#contact_name_heading").show();
      $("#contact_title_heading").show();
      $("#address_street_heading").show();
      $("#address_city_heading").show();
      $("#address_state_heading").show();
      $("#address_zip_heading").show();
      $("#phone_heading").show();
      $("#number_i_booth_heading").show();
      $("#booth_i_cost_heading").show();
      $("#number_o_booth_heading").show();
      $("#booth_o_cost_heading").show();
      $("#width_heading").show();
      $("#length_heading").show();
      $("#booth_cost_heading").show();
      $("#ext_chairs_heading").show();
      $("#chair_cost_heading").show();
      $("#ext_tables_heading").show();
      $("#table_cost_heading").show();
      $("#electric_heading").show();
      $("#electric_cost_heading").show();
      $("#service_description_heading").show();
      $("#service_cost_heading").show();
      $("#Vendors tbody tr").each(function(){ 
        $(this).find('#product').show();
        $(this).find("#contact_name").show();
        $(this).find("#contact_title").show(); 
        $(this).find('#address_street').show(); 
        $(this).find('#address_city').show(); 
        $(this).find('#address_state').show(); 
        $(this).find('#address_zip').show(); 
        $(this).find('#phone').show(); 
        $(this).find("#number_i_booth").show();
        $(this).find("#booth_i_cost").show();
        $(this).find("#number_o_booth").show();
        $(this).find("#booth_o_cost").show();
        $(this).find("#booth_cost").show();
        $(this).find('#width').show();
        $(this).find('#length').show();
        $(this).find("#ext_chairs").show();
        $(this).find("#chair_cost").show();
        $(this).find("#ext_tables").show();
        $(this).find("#table_cost").show();
        $(this).find("#electric").show();
        $(this).find("#electric_cost").show();
        $(this).find("#service_description").show();
        $(this).find("#service_cost").show();
        });  
    };
    
    function clearWhole(){
      var table = document.getElementById('Vendors');
      table.style.fontSize = "14px";
      $("#product_heading").hide();
      $("#contact_name_heading").hide();
      $("#contact_title_heading").hide();
      $("#address_street_heading").hide();
      $("#address_city_heading").hide();
      $("#address_state_heading").hide();
      $("#address_zip_heading").hide();
      $("#phone_heading").hide();
      $("#number_i_booth_heading").hide();
      $("#booth_i_cost_heading").hide();
      $("#number_o_booth_heading").hide();
      $("#booth_o_cost_heading").hide();
      $("#width_heading").hide();
      $("#length_heading").hide();
      $("#booth_cost_heading").hide();
      $("#ext_chairs_heading").hide();
      $("#chair_cost_heading").hide();
      $("#ext_tables_heading").hide();
      $("#table_cost_heading").hide();
      $("#electric_heading").hide();
      $("#electric_cost_heading").hide();
      $("#service_description_heading").hide();
      $("#service_cost_heading").hide();
      $("#Vendors tbody tr").each(function(){ 
        $(this).find('#product').hide();
        $(this).find("#contact_name").hide();
        $(this).find("#contact_title").hide(); 
        $(this).find('#address_street').hide(); 
        $(this).find('#address_city').hide(); 
        $(this).find('#address_state').hide(); 
        $(this).find('#address_zip').hide(); 
        $(this).find('#phone').hide(); 
        $(this).find("#number_i_booth").hide();
        $(this).find("#booth_i_cost").hide();
        $(this).find("#number_o_booth").hide();
        $(this).find("#booth_o_cost").hide();
        $(this).find("#booth_cost").hide();
        $(this).find('#width').hide();
        $(this).find('#length').hide();
        $(this).find("#ext_chairs").hide();
        $(this).find("#chair_cost").hide();
        $(this).find("#ext_tables").hide();
        $(this).find("#table_cost").hide();
        $(this).find("#electric").hide();
        $(this).find("#electric_cost").hide();
        $(this).find("#service_description").hide();
        $(this).find("#service_cost").hide();
        });  
    };
    
    function showContact(){
    $("#product_heading").show();
    $("#contact_name_heading").show();
    $("#contact_title_heading").show();
    $("#address_street_heading").show();
    $("#address_city_heading").show();
    $("#address_state_heading").show();
    $("#address_zip_heading").show();
    $("#phone_heading").show();
    $("#Vendors tbody tr").each(function(){ 
      $(this).find('#product').show();
      $(this).find("#contact_name").show();
      $(this).find("#contact_title").show(); 
      $(this).find('#address_street').show(); 
      $(this).find('#address_city').show(); 
      $(this).find('#address_state').show(); 
      $(this).find('#address_zip').show(); 
      $(this).find('#phone').show(); 
      });  
    };
    
    function clearContact(){
    $("#product_heading").hide();
    $("#contact_name_heading").hide();
    $("#contact_title_heading").hide();
    $("#address_street_heading").hide();
    $("#address_city_heading").hide();
    $("#address_state_heading").hide();
    $("#address_zip_heading").hide();
    $("#phone_heading").hide();
    $("#Vendors tbody tr").each(function(){ 
      $(this).find('#product').hide();
      $(this).find("#contact_name").hide();
      $(this).find("#contact_title").hide(); 
      $(this).find('#address_street').hide(); 
      $(this).find('#address_city').hide(); 
      $(this).find('#address_state').hide(); 
      $(this).find('#address_zip').hide(); 
      $(this).find('#phone').hide(); 
      });  
      
    };
    
    function clearBooth() {
      $("#number_i_booth_heading").hide();
      $("#booth_i_cost_heading").hide();
      $("#number_o_booth_heading").hide();
      $("#booth_o_cost_heading").hide();
      $("#booth_cost_heading").hide();
      $("#width_heading").hide();
      $("#length_heading").hide();
      //clear entries
      $("#Vendors tbody tr").each(function(){
        $(this).find("#number_i_booth").hide();
        $(this).find("#booth_i_cost").hide();
        $(this).find("#number_o_booth").hide();
        $(this).find("#booth_o_cost").hide();
        $(this).find("#booth_cost").hide();
        $(this).find('#width').hide();
        $(this).find('#length').hide();
      });
      //uncheck checkboxes
      $('#filter_number_i_booth').removeAttr('checked').change();
      $('#filter_number_o_booth').removeAttr('checked').change();
      $('#filter_custom_booth').removeAttr('checked').change();
    };
    
    function clearServices() {
      $("#ext_chairs_heading").hide();
      $("#chair_cost_heading").hide();
      $("#ext_tables_heading").hide();
      $("#table_cost_heading").hide();
      $("#electric_heading").hide();
      $("#electric_cost_heading").hide();
      $("#service_description_heading").hide();
      $("#service_cost_heading").hide();
      //clear entries
      $("#Vendors tbody tr").each(function(){
        $(this).find("#ext_chairs").hide();
        $(this).find("#chair_cost").hide();
        $(this).find("#ext_tables").hide();
        $(this).find("#table_cost").hide();
        $(this).find("#electric").hide();
        $(this).find("#electric_cost").hide();
        $(this).find("#service_description").hide();
        $(this).find("#service_cost").hide();
      });
      //uncheck checkboxes
      $('#filter_ext_chairs').removeAttr('checked').change();
      $('#filter_ext_tables').removeAttr('checked').change();
      $('#filter_electric').removeAttr('checked').change();
      $('#filter_service_description').removeAttr('checked').change();
    };
    
    //sorting functions/////////////////////////////////////////////////////////
    $(".sorter").change(function() {
      $("#contact_name_heading").hide();
      $("#phone_heading").hide();
      
      $("#Vendors tbody tr").each(function(){ 
        $(this).hide(); 
        $(this).find("#contact_name").hide();
        $(this).find("#phone").hide();
      });
      
      //checkbox in booth tab clicked
      if ($("#nav_booth_li").hasClass("active")) {
        $("#service_cost_heading").hide();
        $("#booth_cost_heading").show();
        $("#Vendors tbody tr").each(function(){ 
          $(this).find("#service_cost").hide(); 
          $(this).find("#booth_cost").show();
        });
      }
      //checkbox in services tab clicked
      if ($("#nav_services_li").hasClass("active")) {
        $("#service_cost_heading").show();
        $("#booth_cost_heading").hide();
        $("#Vendors tbody tr").each(function(){ 
          $(this).find("#service_cost").show(); 
          $(this).find("#booth_cost").hide();
        });
      }
      
      
      //iterate through all checkboxes
      $('.sorter').each(function() {
        
        
        
        //filter by number_i_booth---------------------------------------------
        if ($(this).attr("id") == "filter_number_i_booth" && $(this).is(":checked")){
          $("#number_i_booth_heading").show();
          $("#booth_i_cost_heading").show();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#number_i_booth").show();
            $(this).find("#booth_i_cost").show();
            if ($(this).find("#number_i_booth").html() != 0)
              $(this).show();
          });
        }
        else if ($(this).attr("id") == "filter_number_i_booth" && !$(this).is(":checked")){
          $("#number_i_booth_heading").hide();
          $("#booth_i_cost_heading").hide();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#number_i_booth").hide();
            $(this).find("#booth_i_cost").hide();
          });
        }
        //end number_i_booth
        
        //filter by number_o_booth---------------------------------------------
        if ($(this).attr("id") == "filter_number_o_booth" && $(this).is(":checked")){
          $("#number_o_booth_heading").show();
          $("#booth_o_cost_heading").show();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#number_o_booth").show();
            $(this).find("#booth_o_cost").show();
            if ($(this).find("#number_o_booth").html() != 0)
              $(this).show();
          });
        }else if ($(this).attr("id") == "filter_number_o_booth" && !$(this).is(":checked")){
          $("#number_o_booth_heading").hide();
          $("#booth_o_cost_heading").hide();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#number_o_booth").hide();
            $(this).find("#booth_o_cost").hide();
          });
        }
        //end number_o_booth
        
        //filter by custom_booth---------------------------------------------
        if ($(this).attr("id") == "filter_custom_booth" && $(this).is(":checked")){
          $("#width_heading").show();
          $("#length_heading").show();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#length").show();
            $(this).find("#width").show();
            if ($(this).find("#width").html() != 0)
              $(this).show();
          });
        }
        else if ($(this).attr("id") == "filter_custom_booth" && !$(this).is(":checked")){
          $("#width_heading").hide();
          $("#length_heading").hide();
          $("#Vendors tbody tr").each(function(){ 
            $(this).find("#length").hide();
            $(this).find("#width").hide();
          });
        }
        //end custom_booth
        
        //filter by ext_chairs--------------------------------------------------
        if ($(this).attr("id") == "filter_ext_chairs" && $(this).is(":checked")){
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
          
        //filter by ext_tables--------------------------------------------------
        if ($(this).attr("id") == "filter_ext_tables" && $(this).is(":checked")){
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
        
        //filter by electric----------------------------------------------------
        if ($(this).attr("id") == "filter_electric" && $(this).is(":checked")){
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
        
        //filter by service_description-----------------------------------------
        if ($(this).attr("id") == "filter_service_description" && $(this).is(":checked")){
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
}));