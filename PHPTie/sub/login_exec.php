<?php
	//Start session
	session_start();
 
	//Include database connection details
	require_once('Includes/connection.php');
 	
	//Array to store validation errors
	$errmsg_arr = array();
 
	//Validation error flag
	$errflag = false;
 
	//Function to sanitize values received from the form. Prevents SQL injection
	function clean($str) {
		echo "str: ".$str;
		$str = @trim($str);
		if(get_magic_quotes_gpc()) {
			$str = stripslashes($str);
		}
		return mysqli_real_escape_string($str);
	}
 
	//Sanitize the POST values
	$username = $_POST['username'];
	$password = trim($_POST['password']);
 
	//Input Validations
	if($username == '') {
		$errmsg_arr[] = 'Username missing';
		$errflag = true;
	}
	if($password == '') {
		$errmsg_arr[] = 'Password missing';
		$errflag = true;
	}
 
	//If there are input validations, redirect back to the login form
	if($errflag) {
		$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
		session_write_close();
		header("location: Index.php");
		exit();
	}
   	mysqli_select_db($conn,$mysql_database) or die("Could not select database");
	//Create query
	$qry="SELECT * FROM admin_master WHERE Emailid='$username' AND User_Pwd='$password'";
	//$result = sqlsrv_query($conn, $qry, array(), array("Scrollable" => 'static'));
	$result=mysqli_query($conn,$qry);
 	echo $qry;
	//exit;
	//Check whether the query was successful or not
	if($result) {
		
		if(mysqli_num_rows($result) > 0) {
			//Login Successful
			echo mysqli_num_rows($result)."chv";
		//exit;
			session_regenerate_id();
			$member = mysqli_fetch_array($result);
			$_SESSION['SESS_MEMBER_TYPE'] = $member['Role_ID'];
			$_SESSION['SESS_FIRST_NAME'] = $member['FirstName'];
			$_SESSION['SESS_LAST_NAME'] = $member['LastName'];
			$_SESSION['SESS_DOMAIN'] = $member['User_Domain'];
			session_write_close();
			echo $_SESSION['SESS_FIRST_NAME'];
			header("location: Home.php");
			exit();
		}else {
			//Login failed
			$errmsg_arr[] = 'user name and password not found';
			$errflag = true;
			if($errflag) {
				$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
				session_write_close();
				header("location: Index.php");
				exit();
			}
		}
	}else {
		die("Query failed");
	}
?>