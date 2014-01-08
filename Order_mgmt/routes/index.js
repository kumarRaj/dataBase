var connectionObject = require('./connection.js').con;
var mysql = require('mysql');


var viewQueryResults = function(query, res, perFormOperation){
	var connection = mysql.createConnection(connectionObject);
	connection.connect();
	connection.query(query,{}, perFormOperation(res));
	connection.end();
}

var executeQuery = function(query, dataToInsert, products, res, insertFunction){
	var connection = mysql.createConnection(connectionObject);
	console.log("",dataToInsert);
	connection.query(query,dataToInsert, insertFunction(res,products));
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
var order_items = function(products){
	return function(err, result){
		if (err) throw err;
		console.log("yaha",products);
		var connection = mysql.createConnection(connectionObject);
		// var keys = Object.keys(products);
		console.log(products);
		connection.query("insert into order_items values("+result.insertId+",'rice_basmati',4 )",{},function(err,result){
		if (err) throw err;

		});
	}
}

var insertOrder = function(res, products){
	return function(err, result) {
		 if (err) throw err;
		 var query = "insert into orders (cust_id,amount)values("+result.insertId+",500)";
		 var connection = mysql.createConnection(connectionObject);
		 connection.query(query,{},order_items(products));
		 	// console.log(result);
	}
	res.end();
}
exports.placeOrder = function(req, res){
	customer = {};
	products = req.body;
	var actualProducts = {};
	customer.name = products.user_name;
	customer.contact_no = products.contact_no;
	delete(products["user_name"]);
	delete(products["contact_no"]);
	var keys = Object.keys(products);
	keys.forEach(function(item){
		if(products[item] != ''){
			actualProducts[item] = products[item][0]; 
		}
	});
	console.log(customer);
	console.log(actualProducts);
	executeQuery('insert into customer set ?',customer,actualProducts,res,insertOrder);
}