var connectionObject = require('./connection.js').con;
/*
 * GET home page.
 */
var mysql = require('mysql');
console.log(connectionObject);
var connection = mysql.createConnection(connectionObject);

var viewqueryResults = function(query, res){
	connection.connect();
	connection.query(query,{}, function(err, rows, fields) {
	 if (err) throw err;
	 	res.render('products',{products:rows});
	});
	connection.end();
}

exports.order = function(req, res){
	var productsQuery = "select p_id,p_name,p_price from Product";
	viewqueryResults(productsQuery,res);
}