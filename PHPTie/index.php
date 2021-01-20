<?php
	//Start session
	session_start();	
	//Unset the variables stored in session
	unset($_SESSION['SESS_MEMBER_ID']);
	unset($_SESSION['SESS_FIRST_NAME']);
	unset($_SESSION['SESS_LAST_NAME']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="TiE50 Awards, TiECON, TiESV, TiE Silcion Valley">
<meta name="description" content="TiE50 Awards for Best Start-up Companies">
<meta name="google-site-verification" content="7Rdl3hhCaKBgpLUrDrplEwArZLZwhqqLf8UBjSmt3Io">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="img/favicon.ico">
<title>Welcome to Speaker Curation Interface</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">

<!-- Animation Styles -->
<link href="css/support_css/animate.css" rel="stylesheet">

<!-- Tie Styles -->
<link href="css/tie_style.css" rel="stylesheet">

<!-- font-awesome Styles -->
<link href="css/support_css/font-awesome.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">

<style>
body, html {
		width:100%;
		height:100%;
		
}

</style>
</head>

<body>
<section><!-----	Header Beging---->
 
  	
<?php 
include("top_strip.php");
?>
 

<!-----Header Ends------>

<section><!--- Content Begin--->
  
  <div class="container bg_white" >
  <br/>
  <div class="row" style="overflow:hidden">
    <div class="col-lg-11 out_line bg_lightgray thin_boreder" style="overflow:hidden;">
      <div class="col-lg-12 col-sm-12 col-xs-12 text_blue" style="margin-top:10%; margin-bottom:10%;">
       	
         <div class="row">
         	
            
            <table border="0" align="center">
				<tr><td height="1"><font style="COLOR: red; FONT-FAMILY: Verdana, Arial, Helvetica; FONT-SIZE: 8pt; FONT-WEIGHT: bold; text-decoration:none">
				<!--the code bellow is used to display the message of the input validation-->
				 <?php
					if( isset($_SESSION['ERRMSG_ARR']) && is_array($_SESSION['ERRMSG_ARR']) && count($_SESSION['ERRMSG_ARR']) >0 ) {
					echo '<ul class="err">';
					foreach($_SESSION['ERRMSG_ARR'] as $msg) {
						echo '<li>',$msg,'</li>'; 
						}
					echo '</ul>';
					unset($_SESSION['ERRMSG_ARR']);
					}
				?>
				</font></td></tr>
			
			</table><br><br><br>

<form name="loginform" action="login_exec.php" method="post">
<table width="30%" align="center" border="1" bordercolor="black" cellpadding="5" cellspacing="5" bgcolor="#f0e5dd" style="border-collapse:collapse;">			
				<tr>
				  <td bgColor="#082F87" height="10" width="100%"><p align="left">&nbsp;<span style="COLOR: white; FONT-FAMILY: Verdana, Arial, Helvetica; FONT-SIZE: 8pt; FONT-WEIGHT: bold" vAlign="middle">Curation Screener Login &raquo;</span></td>
				</tr>
				<tr>
				  <td bgcolor="#99B6DD" height="14" vAlign="top" width="100%"><br>
					
				
				<table width="100%" >
					<tr>
					<td align="right">&nbsp;<b>Login ID:&nbsp;</b></td><td colspan="2"><input name="username" placeholder="Username" required type="text" maxlength="30" /></td>
					</tr>
					<tr colspan="3"><td>&nbsp;</td></tr>
					<tr>
					<td align="right">&nbsp;<b>Password:&nbsp;</b></td><td><input name="password" type="password" placeholder="Password" required maxlength="50" />
</td>
							<td align="center"><input name="" type="submit" value="login" /></td></tr>
						</table><br>


		  </td>
				</tr>						
			</table>
  
</form>
<br><br><br>

         </div>
      </div>
    </div>
  </div>
  <br/>
 
</section>
<!--- Content End---> 

<?php 
include("bottom_strip.php");
?>


</body>
</html>