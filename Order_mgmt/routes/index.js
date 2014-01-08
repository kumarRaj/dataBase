// var connectionObject = require('./connection.js').con;
var connectionObject = {
	 host     : 'localhost',
	 user     : 'raj',
	 password : 'P@ssw0rd',
	 database : 'dbms_assignments'
};

/*
 * GET home page.
 */
var mysql = require('mysql');

var viewqueryResults = function(query, res){
	var connection = mysql.createConnection(connectionObject);
	connection.connect();
	connection.query(query,{}, function(err, rows, fields) {
	 if (err) throw err;
	 	res.render('products',{products:rows});
	});
	connection.end();
}
var executeQuery = function(query, dataToInsert, res){
	var connection = mysql.createConnection(connectionObject);
	connection.query(query,dataToInsert, function(err, result) {
	 if (err) throw err;
	 res.end();
	});
	connection.end();
}

exports.order = function(req, res){
	var productsQuery = "select p_id,p_name,p_price from Product";
	viewqueryResults(productsQuery,res);
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
	executeQuery('insert into customer set ?',customer,res);
	// executeQuery('insert into orders set ?',customer,res);
}