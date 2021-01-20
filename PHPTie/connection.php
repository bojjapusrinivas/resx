<?php
/*
//My SQL Server Connection 
$mysql_hostname = "localhost";
$mysql_user = "root";
$mysql_password = "";
$mysql_database = "simple_login";
$prefix = "";
$bd = mysqli_connect($mysql_hostname, $mysql_user, $mysql_password) or die("Could not connect database");
mysqli_select_db($bd, $mysql_database) or die("Could not select database");
*/

// SQL Server Database connection
$serverName = "184.168.194.78";
$connectionInfo = array( "Database"=>"bizacumen_Analyst_vizag", "UID"=>"new_sisuser", "PWD"=>"sisindia959$");
$conn = sqlsrv_connect( $serverName, $connectionInfo) OR die ('broke:' .sqlsrv_errors());
?>