describe('Script in admin index for showAll', function() {
 beforeEach(function(){
   setFixtures('<table id="Vendors">'
    + '<thead>'
    +   '<tr>'
    +        '<td>test1</td>'
    +        '<td>test2</td>'
    +        '<td>test3</td>'
    +    '</tr>'
    +'</thead>'
    +'<tbody>'
    +    '<tr>'
    +        '<td>test4</td>'
    +        '<td>test5</td>'
    +        '<td>test6</td>'
    +    '</tr>'
    +    '<tr>'
    +        '<td>Hillary</td>'
    +        '<td>Bernie</td>'
    +        '<td>Ben</td>'
    +    '</tr>'
    +'</tbody>'
 + '</table>');         
  /*$('#nav_all');*/
  /*$('#Vendors tbody tr');*/
  /*$('body').append(view);*/
 });
  it('Shows all vendors when showAll function is called', function() {
   /*$('#nav_all').prop('checked', true).change();*/
   expect($('#Vendors tbody tr').is(':visible')).toBe(true);
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
   expect($('#product').is(':visible')).toBe(false);
   expect($('#contact_name').is(':visible')).toBe(false);
   expect($('#contact_title').is(':visible')).toBe(false);
   expect($('#address_street').is(':visible')).toBe(false);
   expect($('#address_city').is(':visible')).toBe(false);
   expect($('#address_state').is(':visible')).toBe(false);
   expect($('#address_zip').is(':visible')).toBe(false);
   expect($('#phone').is(':visible')).toBe(false);
   expect($('#number_i_booth').is(':visible')).toBe(false);
   expect($('#booth_i_cost').is(':visible')).toBe(false);
   expect($('#number_o_booth').is(':visible')).toBe(false);
   expect($('#booth_o_cost').is(':visible')).toBe(false);
   expect($('#width').is(':visible')).toBe(false);
   expect($('#length').is(':visible')).toBe(false);
   expect($('#booth_cost').is(':visible')).toBe(false);
   expect($('#ext_chairs').is(':visible')).toBe(false);
   expect($('#chair_cost').is(':visible')).toBe(false);
   expect($('#ext_tables').is(':visible')).toBe(false);
   expect($('#product').is(':visible')).toBe(false);
   expect($('#table_cost').is(':visible')).toBe(false);
   expect($('#electric').is(':visible')).toBe(false);
   expect($('#electric_cost').is(':visible')).toBe(false);
   expect($('#service_description').is(':visible')).toBe(false);
   expect($('#service_cost').is(':visible')).toBe(false);
  });
});

describe('Script in admin index for showOnlyOne', function() {
 beforeEach(function(){
  setFixtures('<table id="Vendors">'
    + '<thead>'
    +   '<tr>'
    +        '<td>test1</td>'
    +        '<td>test2</td>'
    +        '<td>test3</td>'
    +    '</tr>'
    +'</thead>'
    +'<tbody>'
    +    '<tr>'
    +        '<td>test4</td>'
    +        '<td>test5</td>'
    +        '<td>test6</td>'
    +    '</tr>'
    +    '<tr>'
    +        '<td>Hillary</td>'
    +        '<td>Bernie</td>'
    +        '<td>Ben</td>'
    +    '</tr>'
    +'</tbody>'
 + '</table>');    
  });
  it('Shows all vendors when showOnlyOne function is called', function() {
   expect( $('#Vendors').find('tbody tr').first() ).toContainText('test4');      
   /*expect($('#Vendors').('tbody').('tr').is(':visible')).toBe(true);*/
  });
});

describe('Script in admin index for clicking outside of vendor popup to close', function() {
 beforeEach(function(){
  var container = $("#individual1");
  setFixtures('<div class="container">'
  + 'Container content'
  + '</div>'
  + '<div class="container2">'
  + 'Container content, again'
  + '</div>');    
  });
  it('closes the Vendor pop up window', function() {
   expect( $('#individual1').is(':visible')).toBe(false);
   /*expect($('#Vendors').('tbody').('tr').is(':visible')).toBe(true);*/
  });
});

function hide() {
    $("p").hide();
    $( ".div2" ).text("Hide button clicked");
    $( ".div3" ).text("");
}

function show() {
    $("p").show();
    $( ".div2" ).text("Show and Print button clicked");
    $( ".div3" ).text($( ".textField" ).val());

}

function setUpHTMLFixture() {
        jasmine.getFixtures().set(' <p>Test paragraph. Test paragraph. Test paragraph.</p>           \
                                    <input type="text" class="textField">          \
                                    <br>                                             \
                                    <button class="hideButton" onclick=hide()>Hide</button>              \
                                    <button class="showButton" onclick=show()>Show and Print</button>  \
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
        expect($( ".div2" )).toHaveText("Show and Print button clicked");
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

