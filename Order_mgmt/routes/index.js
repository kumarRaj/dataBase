var connectionObject = require('./connection.js').con;
var mysql = require('mysql');


var viewQueryResults = function(query, res, perFormOperation){
	var connection = mysql.createConnection(connectionObject);
	connection.connect();
	connection.query(query,{}, perFormOperation(res));
	connection.end();
}

var executeQuery = function(query, dataToInsert, res, insertFunction){
	var connection = mysql.createConnection(connectionObject);
	connection.query(query,dataToInsert, insertFunction(res));
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
var insertOrder = function(res){
	return function(err, result) {
		 if (err) throw err;
		 var query = "insert into orders (cust_id,amount)values("+result.insertId+",500)";
		 var connection = mysql.createConnection(connectionObject);
		 connection.query(query,{},function(err, result){
		 	if (err) throw err;
		 	console.log(result);
		 });
	}
	res.end();
}
exports.placeOrder = function(req, res){
	customer = {};
	products = req.body;
	customer.name = products.user_name;
	customer.contact_no = products.contact_no;
	delete(products["user_name"]);
	delete(products["contact_no"]);
	console.log(customer);
	console.log(products);

	executeQuery('insert into customer set ?',customer,res,insertOrder);
	// executeQuery('insert into orders set ?c',customer,res);
}