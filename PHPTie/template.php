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

<!-- Bootstrap core CSS -->
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
<script src="js/jquery.imagecube.js"></script>
<script src="js/bootstrap.min.carousel.support.js"></script>
<script src="js/owl.carousel.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
<script type="text/javascript" src="images/clients.js"></script> 
                  <script type="text/javascript" src="js/jquery.min.js"></script> 
                  <script type="text/javascript" src="js/fadeslideshow.js"></script> 
                  <script type="text/javascript">

var mygallery=new fadeSlideShow({
	wrapperid: "fadeshow1", //ID of blank DIV on page to house Slideshow
	dimensions: [220, 220], //width/height of gallery in pixels. Should reflect dimensions of largest image
	imagearray: [
		["images/tie50_logo_finalist.jpg"],
		["images/tie50_logo_nominee.jpg"],
		["images/tie50_logo_winner.jpg"] //<--no trailing comma after very last image element!
	],
	displaymode: {type:'auto', pause:2500, cycles:0, wraparound:false},
	persist: false, //remember last viewed slide and recall within same session?
	fadeduration: 500, //transition duration (milliseconds)
	descreveal: "ondemand",
	togglerid: ""
})

function funGo()
{
    window.open(document.getElementById("cmb_Go").value).focus()
}

</script>
</html>