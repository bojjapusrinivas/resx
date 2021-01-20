<?php
	require_once('auth.php');
?>
<html>
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
<!--- Basic javascript----->
<script src="js/respond.min.js"></script>
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script src="js/modernizr.js"></script>
<!--script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/bootstrap.min.carousel.support.js"></script>
<script src="js/owl.carousel.js"></script>
<style>

body, html {
		width:100%;
		height:100%;
		
}

</style>
</head>
<title>Search</title>
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
         	
            
            


<h2>Search</h2>
<p align="center"><a href="index.php">logout</a></p>
<form name="search" method="post" action="basic.php">
Seach for: <input type="text" placeholder="Keywords" name="find" /> 
<!--
<div class="row form-group">
                <div class="col-xs-12 col-md-2">
                    <select id="curation_level" name="curation_level" class=" form-control"><option value="">Curation</option><option value="1">New</option><option value="2">Curated</option><option value="3">Completed</option></select>
                </div>
                                <div class="col-xs-12 col-md-2">
                    <div class="form-group" style="margin-bottom: 0;">
                        <select id="VirtualSig" name="VirtualSig" class=" form-control"><option value="">Domain</option><option value="46">Women in Technology</option><option value="1">3D Printing</option><option value="2">Advertising/Media/Marketing/Social</option><option value="3">Automotive</option><option value="4">Big Data</option><option value="5">Biometrics</option><option value="6">Clean Tech/Alternate Energy</option><option value="7">Cloud /IT/Infra/Security</option><option value="8">Curated Web</option><option value="9">Design/UI/UX</option><option value="10">Digital Health/Healthcare</option><option value="11">Drones</option><option value="13">Education/Online Learning</option><option value="14">Enterprise Software</option><option value="15">Fashion</option><option value="16">Film/Motion Picture</option><option value="17">Fintech</option><option value="19">Gaming/Online Entertainment</option><option value="22">Home Automation</option><option value="24">Internet of Things (IoT)</option><option value="26">Machine Learning</option><option value="27">Manufacturing</option><option value="28">mCommerce</option><option value="29">Mobile Location Technologies</option><option value="30">Mobile Messaging</option><option value="31">Nanotech</option><option value="33">Online Shopping</option><option value="36">Robotics</option><option value="37">Semiconductor</option><option value="38">Smart Cities</option><option value="39">Software Defined Networks</option><option value="40">Travel</option><option value="41">Video Streaming</option><option value="42">Virtual Reality/Augmented Reality</option><option value="43">Wearables</option><option value="44">Wireless/Telecom</option><option value="45">Social Entrepreneurship</option><option value="47">Startups</option><option value="48">Angel &amp; VC Investments</option><option value="49">Consumer Batteries</option><option value="50">Cloud Services</option><option value="51">Augmented Reality</option><option value="52">Data Center</option><option value="53">TiEcon 2017</option><option value="54">Gaming VC</option><option value="55">Machine Learning VC</option><option value="56">Media</option><option value="57">CIO</option><option value="58">autonomous vehicles</option><option value="59">Cloud Security</option><option value="60">EdTech</option></select>
                    </div>
                </div>

                <div class="col-xs-12 col-md-2">
                    <select id="EventCategory" name="EventCategory" class=" form-control"><option value="">Category</option><option value="1">TiE SV</option><option value="2">Other</option></select>
                </div>

                <div class="col-xs-12 col-md-2">
                    <select id="approve_status" name="approve_status" class=" form-control"><option value="">All</option><option value="is_approved">Approved</option><option value="is_disapproved">Disapproved</option></select>
                </div>

                <div class="col-xs-12 col-md-2">
                    <input type="text" id="keywords" name="keywords" placeholder="Keywords" class=" form-control">
                </div>
            </div>
-->
<input type="submit" name="search" value="Search" />
</form>

</body>
<?php SESSION_START();?>
<?php 
echo "<h2>Search Results:</h2><p>";
if ($find == "")
{
$find =$_POST['find'];
}
else
{$find=$_REQUEST['find'];}
//If they did not enter a search term we give them an error
if ($find)
	{
		echo "<p>You forgot to enter a search term!!!";
		//exit;
	}
IF ($_REQUEST['find']<>"")
{$find=$_REQUEST['find'];}
// Otherwise we connect to our Database
$serverName = "184.168.194.78";
$connectionInfo = array( "Database"=>"bizacumen_Analyst_vizag", "UID"=>"new_sisuser", "PWD"=>"sisindia959$");
$conn = sqlsrv_connect( $serverName, $connectionInfo) OR die ('broke:' .sqlsrv_errors());
$output = '';

// We perform a bit of filtering
//$find = strtoupper($find);
//$find = strip_tags($find);
$find = trim ($find);

echo $_REQUEST['find'] . " for testing  ";
//Now we search for our search term, in the field the user specified
$sql="SELECT User_Name,SurName,Rec_ID,user_phone FROM TBL_SIS_Applications WHERE User_Name LIKE ('%".$find."%')";
$_SESSION['sql']=$sql;
//$GLOBALS['sqlqry']=$sql;
//echo $_SESSION['sql'];
//exit;
//$sql="SELECT * FROM TBL_SIS_Applications WHERE CONCAT(User_Name,SurName) LIKE ('%".$find."%')";
//$iname = sqlsrv_query($conn, "SELECT * FROM TBL_SIS_Applications WHERE (User_Name) LIKE ('%".$find."%')") or die('broke:' .sqlsrv_errors());
$iname = sqlsrv_query($conn, $sql, array(), array("Scrollable" => 'static'));
$num_rows = sqlsrv_num_rows($iname);
// echo $count ." count";
$per_page = 10;   
// Per Page
$page  = 1;

if(isset($_GET["Page"]))
{
$page = $_GET["Page"];
}
 
$prev_page = $page-1;

$next_page = $page+1;
 
$row_start = (($per_page*$page)-$per_page);

if($num_rows<=$per_page)
{
$num_pages =1;
}

else if(($num_rows % $per_page)==0)
{
$num_pages =($num_rows/$per_page) ;
}

else
{
$num_pages =($num_rows/$per_page)+1;

$num_pages = (int)$num_pages;
}
$row_end = $per_page * $page;

if($row_end > $num_rows)
{
$row_end = $num_rows;
}

 
$num_field=sqlsrv_num_fields($iname); 

//And we display the results
if($num_rows == 0) 
	{
        $output = "Sorry, but we can not find an entry to match your query...<br><br>";
    } else 
	{
		$max_per_row = 1;
		$item_count = 0;
		echo "<p><b>Searched For:</b> " .$find."   <br>Record Count:".$count ."</p>";
		echo "<table  width='78%' align='left' cellpadding='5' cellspacing='0' border='1' bordercolor='#51ADD2' style='border-collapse:collapse;'>";
		echo "<tr style='background-color:#169FE6; color:white;'><td>Name</td><td>Surname</td><td>Id</td></tr>";

		echo "<tr>";
  		while($result = sqlsrv_fetch_array($iname)) 
		{
			if ($item_count == $max_per_row)
			    {
			        echo "</tr><tr>";
			        $item_count = 0;
			    }

			echo "<td>".$result['User_Name']."</td>";
			echo "<td>".$result['SurName']."</td>";
			echo "<td>".$result['Rec_ID']."</td>";
			$item_count++;
		}
		echo "</tr>";
		echo "</table>";

	}


//This counts the number or results - and if there wasn't any it gives them a     little     message explaining that
//$anymatches=mysql_num_rows($iname);
//if ($anymatches == 0)
//{
//echo "Sorry, but we can not find an entry to match your query...<br><br>";
//}

//And we remind them what they searched for
echo $output;
//}
 echo"<table class='text_blue' style='clear:both;'><tr><td>";
?> 


Total <?php echo $num_rows;?> Record : <?php echo $num_pages;?> Page :
<?php

if($prev_page)

{

echo " <a class='text_blue' href='$_SERVER[SCRIPT_NAME]?Page=$prev_page&find=$find'><< Back</a> ";

}

 

for($i=1; $i<=$num_pages; $i++){

if($i != $page)

{

echo "[ <a class='text_blue' href='$_SERVER[SCRIPT_NAME]?Page=$i&find=$find'>$i</a> ]";

}

else

{

echo "<b> $i </b>";

}

}

if($page!=$num_pages)

{

echo " <a class='text_blue' href ='$_SERVER[SCRIPT_NAME]?Page=$next_page&find=$find'>Next>></a> ";

}
echo "</td></tr></table>";
sqlsrv_close($conn);

?>
<br>
<p><a href="export-book.php" class='text_blue'><b> Export To Excel </b></a></p>
</div>
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
<script type="text/javascript" src="images/clients.js"></script> 
                  <script type="text/javascript" src="js/jquery.min.js"></script> 
                  <script type="text/javascript" src="js/fadeslideshow.js"></script> 
                  
<script>
function funGo()
{
    window.open(document.getElementById("cmb_Go").value).focus()
}

</script>
</body>
</html>