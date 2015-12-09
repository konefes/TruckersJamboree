describe('Script in admin index for showAll', function() {
 beforeEach(function(){
  $('#nav_all');
  $('#Vendors tbody tr');
  /*$('body').append(view);*/
 });
  it('Shows all vendors when showAll function is called', function() {
   $('#nav_all').prop('checked', true).change();
   expect($('#Vendors tbody tr').is(':visible')).toBe(false);
  });
});

 describe('Script in admin index for showWhole', function() {
  beforeEach(function(){
      var view
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
      $('#Vendors tbody tr').each();
      $('body').append(view);
  });
  it('ShowWhole function behavior is triggered', function() {
   expect($('#product')).toBeTruthy();
   expect($('#contact_name')).toBeTruthy();
   expect($('#contact_title')).toBeTruthy();
   expect($('#address_street')).toBeTruthy();
   expect($('#address_city')).toBeTruthy();
   expect($('#address_state')).toBeTruthy();
   expect($('#address_zip')).toBeTruthy();
   expect($('#phone')).toBeTruthy();
   expect($('#number_i_booth')).toBeTruthy();
   expect($('#booth_i_cost')).toBeTruthy();
   expect($('#number_o_booth')).toBeTruthy();
   expect($('#booth_o_cost')).toBeTruthy();
   expect($('#width')).toBeTruthy();
   expect($('#length')).toBeTruthy();
   expect($('#booth_cost')).toBeTruthy();
   expect($('#ext_chairs')).toBeTruthy();
   expect($('#chair_cost')).toBeTruthy();
   expect($('#ext_tables')).toBeTruthy();
   expect($('#product')).toBeTruthy();
   expect($('#table_cost')).toBeTruthy();
   expect($('#electric')).toBeTruthy();
   expect($('#electric_cost')).toBeTruthy();
   expect($('#service_description')).toBeTruthy();
   expect($('#service_cost').is(':visible')).toBe(false);
  });
});


function hide() {
    $("p").hide();
    $( ".div2" ).text("Hide button clicked");
    $( ".div3" ).text("");
}

function show() {
    $("p").show();
    $( ".div2" ).text("Show & Print button clicked");
    $( ".div3" ).text($( ".textField" ).val());

}

function setUpHTMLFixture() {
        jasmine.getFixtures().set(' <p>This is a paragraph.</p>           \
                                    <input type="text" class="textField">          \
                                    <br>                                             \
                                    <button class="hideButton" onclick=hide()>Hide</button>              \
                                    <button class="showButton" onclick=show()>Show & Print</button>  \
                                    <div class="div2" id="div2"></div>                         \
                                    <br>                             \
                                    <div class="div3"></div>   \
                                ');
}

describe("Tests for Show Button on Form", function() {

    var formText = "some text here for show test"
    beforeEach(function() {
        setUpHTMLFixture();

        $( ".textField" ).val(formText);
        $(".showButton").click();
    });

    it("should result in correct text about show button clicked", function() {
        expect($( ".div2" )).toHaveText("Show & Print button clicked");
    });

    it("should result in paragraph being visible", function() {
        expect($("p")).toBeVisible();
    });

    it("should result in correct text from form being printed out", function() {
        expect($( ".div3" )).toHaveText(formText);
    });
});

describe("Tests for Hide Button on Form", function() {

    var formText = "some text here for hide test"
    beforeEach(function() {
        setUpHTMLFixture();

        $( ".textField" ).val(formText);
        $(".hideButton").click();
    });

    it("should result in correct text about hide button clicked", function() {
        expect($( ".div2" )).toHaveText("Hide button clicked");
    });

    it("should result in paragraph being hidden", function() {
        expect($("p")).toBeHidden();
    });

    it("should result in form text being hidden", function() {
        expect($( ".div3" )).toBeEmpty();
    });
});

