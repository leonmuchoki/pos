

$(document).on('ready turbolinks:load',function(){
  var sub_total_amount = [];
  var total_amount = 0;
  var total_profit = [];
  var order_food_items = [];

  //------------------------------------------------------------
  // add ordered items to slip
  //--------------------------------------------------------------
  $('#table-order-food').on('click', '.ui-btn', function() {
  	var current_row = $(this).closest("tr");
  	var o_food_name = current_row.find('#order-food-name').val();
  	var o_food_id = current_row.find('#order-food-id').val();
  	var o_food_price = current_row.find('#order-food-price').val();
  	var o_food_quantity = current_row.find('#order-food-quantity').val();

  	var amount = o_food_price * o_food_quantity;
  	sub_total_amount.push(amount);

  	// do summary of items
  	total_amount = 0;
  	$.each(sub_total_amount, function(index, value) {
  	  total_amount += value;
  	});
    
    // display in order slip
  	$("#table-order-slip tbody").append(
      "<tr>" + 
        "<td>" + o_food_name + "</td>" +
        "<td>" + amount + "</td>" +
        "<td>" + o_food_quantity + "</td>" +
        "</tr>"
  	);  

  	$('#table-order-slip-footer h3').html(total_amount);

  	// save ordered foods for submitation later
  	order_food_items.push({
  	  food_id: o_food_id,
  	  quantity: o_food_quantity,
  	  amount: amount
  	});	

  });

  //------------------------------------------------------------
  // submit order
  //--------------------------------------------------------------
  $('#table-order-slip').on('click', '.btnsubmit', function() {
    var o_table_no = $('.restaurant-table-select option:selected').val();
  	var o_staff_id = $('#order-staff-id').val();

  	$.ajax({
  	  type: "POST",
  	  url: "/orders",
  	  data: {order: {amount: total_amount,
  	  	             processed: true, 
  	  	             user_id: o_staff_id,
  	  	             restaurant_table_id: o_table_no,
  	  	             order_foods_attributes: order_food_items}},
  	  dataType: "JSON"
  	}).success(function(response) {
  	    console.log("success" + JSON.stringify(response));

  	    //clean up
  	    total_amount = 0;
  	    $("#table-order-slip tbody tr").remove();
  	    $('#table-order-slip-footer h3').html("Order created successfully.");

  	}).error(function(error) {
  		console.log("error" + JSON.stringify(error));
  	});
  });

});