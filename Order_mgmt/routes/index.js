var connectionObject = require('./connection.js').con;
var mysql = require('mysql');


var viewQueryResults = function(query, res, perFormOperation){
	var connection = mysql.createConnection(connectionObject);
	connection.connect();
	connection.query(query,{}, perFormOperation(res));
	connection.end();
}


var viewProducts = function(res){
	return function(err, rows, fields){
		 if (err) throw err;
		 	res.render('products',{products:rows});
		}
}
exports.order = function(req, res){
	var productsQuery = "select p_id,p_name,p_price from Product";
	viewQueryResults(productsQuery,res,viewProducts);
}

var insertFororder_items = function(products){
	return function(err, result){
		if (err) throw err;
		var order_id = result.insertId;
		order_items = Object.keys(products);
		var connection = mysql.createConnection(connectionObject);
		order_items.forEach(function(item){
			var query = "insert into order_items values (" + order_id +",'" + item +"',"+ products[item] + ")";
			connection.query(query,item,function(err,result){
			if (err) throw err;
			});
		});
	}
}

var insertForOrder = function(res, products){
	return function(err, result) {
		 if (err) throw err;
		 var query = "insert into orders (cust_id,amount)values("+result.insertId+",500)";
		 var connection = mysql.createConnection(connectionObject);
		 connection.query(query,{},insertFororder_items(products));
	}
	res.end();
}

var insertForCustomer = function(query, dataToInsert, products, res, insertFunction){
	var connection = mysql.createConnection(connectionObject);
	connection.query(query,dataToInsert, insertFunction(res,products));
	connection.end();
}

exports.placeOrder = function(req, res){
	input = seperateProductAndCustomer(req.body);
	var customerQuery = 'insert into customer set ?';
	console.log("duba",input);
	insertForCustomer(customerQuery,input.customer,input.products,res,insertForOrder);
}
var seperateProductAndCustomer = function(request){
	var input = {};
	input.customer = {};
	input.products = {};
	input.customer.customer_name = request.customer_name;
	input.customer.contact_no = request.contact_no;
	delete(request["customer_name"]);
	delete(request["contact_no"]);
	var keys = Object.keys(request);
	keys.forEach(function(item){
		if(request[item] != ''){
			input.products[item] = request[item]; 
		}
	});
	return input;
}