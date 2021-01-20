<?php
	//require_once('auth.php');
?>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="TiESV, TiE Silcion Valley">
<meta name="description" content="TiE Silcion Valley">
<meta name="google-site-verification" content="7Rdl3hhCaKBgpLUrDrplEwArZLZwhqqLf8UBjSmt3Io">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="img/favicon.ico">
<title>Welcome to TiE Silcion Valley</title>

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

<script src="bootstrap-multiselect.js"></script>
<link href="bootstrap-multiselect.css" rel="stylesheet">
<style>

html, body {
    width: 100%;
    height: 100%;
}


</style>
// Events

<script>
 $(document).ready(function() {
     $('#ddlCars').multiselect();
      $('#ddlDesignation').multiselect({ 
        // numberDisplayed: 2,
         includeSelectAllOption: true,
		 enableCaseInsensitiveFiltering:true,
          enableFiltering:true ,
		 maxHeight:300     
     });
       $('#ddlCompany').multiselect({ 
         includeSelectAllOption: true,
           enableFiltering:true,         
            enableCaseInsensitiveFiltering:true,
			maxHeight:300
     });
	$('#ddlDomain').multiselect({ 
         includeSelectAllOption: true,
           enableFiltering:true ,  
			enableCaseInsensitiveFiltering:true,      
            maxHeight:300
     });
        $('#ddlLocation').multiselect({  
		   includeSelectAllOption: true,
           enableFiltering:true,   
           nonSelectedText :'Select Location',
		   enableCaseInsensitiveFiltering:true,
		   maxHeight:200
           
     });$('#ddlCompanyType').multiselect({  
		  // includeSelectAllOption: true,
         //  enableFiltering:true,   
           nonSelectedText :'Select Company Type',
		 //  enableCaseInsensitiveFiltering:true,
		 //  maxHeight:200
           
     });
});
</script>
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
      <div class="col-lg-12 col-sm-12 col-xs-12 text_blue" style="margin-top:2%; margin-bottom:5%;">
       	
         <div class="row">

			<?php   
				$sCompany=="";
				$sDesignation == "";
				$sDomain == "";
				
				$WhereCluase=="";
			
				if (($_POST["Designation"]<>"")||($_POST["Domain"]<>"")||($_POST["Company"]<>"")||($_POST["Location"]<>"")||($_POST["find"]<>""))
				{    
					$aCompany= $_POST["Company"];
					If ($aCompany<>"")
					{
						foreach ($aCompany as $value)
						{
						if ($sCompany == "")
						 	{
						          $sCompany = "'".$value;
							}
						   else 
							{ 
							 $sCompany = $sCompany."','".$value;
						         }

						}
						$sCompany = $sCompany. "'";
					}
                    $aDesignation= $_POST["Designation"];
					If ($aDesignation<>"")
					{
						foreach ($aDesignation as $value1)
						{
							if ($sDesignation == "")
						 	{
						          $sDesignation = "'".$value1;
							}
						   else 
							{ 
							 $sDesignation = $sDesignation."','".$value1;
						    }
						}
						$sDesignation  = $sDesignation. "'";
					}
					$aDomain= $_POST["Domain"];
					If ($aDomain<>"")
					{
						foreach ($aDomain as $value2)
						{
								if ($sDomain == "")
								{
									  $sDomain = "'".$value2;
								}
								else 
								{ 
								 $sDomain = $sDomain."','".$value2;
								}
						}
						$sDomain  = $sDomain. "'";
					}
					
					
				    if ($sDesignation<>"")
					{
						$WhereCluase.= " and title in ($sDesignation)";
					}
					if ($sDomain<>"")
					{
						$WhereCluase .= " and Domain in ($sDomain)";
					}					
					
					if ($sCompany <>"")
					{
						$WhereCluase .= " and Company in ($sCompany)";
					}
					if ($_POST['Location']<>"")
					{
						$WhereCluase .= " and Location like ('%".$_POST['Location']."%')";
					}
					if ($_POST['find']<>"")
					{
						$WhereCluase .= " and CONCAT(User_Name,SurName,Title) LIKE ('%".$_POST['find']."%')";
					}
				
			
					//echo $_POST['Designation']."<br>";
					//echo $_POST['Domain']."<br>";
					//echo $_POST['Company']."<br>";
					//echo $_POST['Location']."<br>";
					//echo $_POST['find'];
					  echo "select * from pitchbook where status='Y'".$WhereCluase;
					//exit;
				}
				else
				{
				//	echo "<p style='text-align:center;'>You forgot to select Search terms!!!</p>";
				}


			?>
         	
			<form name="search" method="post" action="pitchbookSearch.php">

			<div class="well col-lg-12 col-sm-12">
			<div class="row">
			  <div class="col-lg-2 col-sm-3 col-xs-12" >  
			<b> Company Type :</b></div>
			 <div class="col-lg-10 col-sm-8 col-xs-12"> 
			 <select  name="CompanyType[]" id="ddlCompanyType" multiple="multiple" class=" form-control"><option value="Public">Public</option><option value="Private">Private</option></select>  <br>
			 </div></div></div>
		

            <div class="well col-lg-12 col-sm-12">
			 <div class="row">
			  <div class="col-lg-2 col-sm-3 col-xs-12" > 
			 <b> Designation :</b></div>
             <div class="col-lg-10 col-sm-8 col-xs-12"> 
			 <select name="Designation[]" id="ddlDesignation" multiple="multiple" class=" form-control">

	<option value='C-Level' class='multiselect-all'>C-Level</option>
<option value='Founder'>&nbsp;&nbsp;&nbsp;&nbsp;Founder</option>
<option value='Co-Founder'>&nbsp;&nbsp;&nbsp;&nbsp;Co-Founder</option>
<option value='Chairman'>&nbsp;&nbsp;&nbsp;&nbsp;Chairman</option>
<option value='Deputy Chairman'>&nbsp;&nbsp;&nbsp;&nbsp;Deputy Chairman</option>
<option value='Managing Director'>&nbsp;&nbsp;&nbsp;&nbsp;Managing Director</option>
<option value='Co-Managing Director'>&nbsp;&nbsp;&nbsp;&nbsp;Co-Managing Director</option>
<option value='Managing Partner'>&nbsp;&nbsp;&nbsp;&nbsp;Managing Partner</option>
<option value='Co-Managing Partner'>&nbsp;&nbsp;&nbsp;&nbsp;Co-Managing Partner</option>
<option value='Corporate Partner'>&nbsp;&nbsp;&nbsp;&nbsp;Corporate Partner</option>
<option value='Principal'>&nbsp;&nbsp;&nbsp;&nbsp;Principal</option>
<option value='Founding Principal'>&nbsp;&nbsp;&nbsp;&nbsp;Founding Principal</option>
<option value='President'>&nbsp;&nbsp;&nbsp;&nbsp;President</option>
<option value='Co-President'>&nbsp;&nbsp;&nbsp;&nbsp;Co-President</option>
<option value='Founding Member'>&nbsp;&nbsp;&nbsp;&nbsp;Founding Member</option>
<option value='Chief Executive Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Executive Officer</option>
<option value='Chief Operating Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Operating Officer</option>
<option value='Chief Financial Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Financial Officer</option>
<option value='Chief Scientific Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Scientific Officer</option>
<option value='Chief Technology Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Technology Officer</option>
<option value='Chief Commercial Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Commercial Officer</option>
<option value='Chief Administrative Officer '>&nbsp;&nbsp;&nbsp;&nbsp;Chief Administrative Officer </option>
<option value='Chief Business Development Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Business Development Officer</option>
<option value='Chief Business Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Business Officer</option>
<option value='Chief Compliance Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Compliance Officer</option>
<option value='Chief Data Science Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Data Science Officer</option>
<option value='Chief Data Scientist'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Data Scientist</option>
<option value='Chief Growth Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Growth Officer</option>
<option value='Chief Information Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Information Officer</option>
<option value='Chief Legal Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Legal Officer</option>
<option value='Chief Medical Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Medical Officer</option>
<option value='Chief People Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief People Officer</option>
<option value='Chief Research Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Research Officer</option>
<option value='Chief Research Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Research Officer</option>
<option value='Chief Revenue Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Revenue Officer</option>
<option value='Chief Safety Innovation Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Safety Innovation Officer</option>
<option value='Chief Sales & Marketing Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Chief Sales & Marketing Officer</option>
<option value='Board of Director'>&nbsp;&nbsp;&nbsp;&nbsp;Board of Director</option>
<option value='GVP-EVP-SVP-VP' class='multiselect-all'>GVP-EVP-SVP-VP</option>
<option value='Group Vice President'>&nbsp;&nbsp;&nbsp;&nbsp;Group Vice President</option>
<option value='Global Vice President'>&nbsp;&nbsp;&nbsp;&nbsp;Global Vice President</option>
<option value='Regional Vice President'>&nbsp;&nbsp;&nbsp;&nbsp;Regional Vice President</option>
<option value='Area Vice President'>&nbsp;&nbsp;&nbsp;&nbsp;Area Vice President</option>
<option value='Corporate Executive Vice President'>&nbsp;&nbsp;&nbsp;&nbsp;Corporate Executive Vice President</option>
<option value='Corporate Vice President'>&nbsp;&nbsp;&nbsp;&nbsp;Corporate Vice President</option>
<option value='Executive Vice President '>&nbsp;&nbsp;&nbsp;&nbsp;Executive Vice President </option>
<option value='Senior Executive Vice President'>&nbsp;&nbsp;&nbsp;&nbsp;Senior Executive Vice President</option>
<option value='Senior Vice President'>&nbsp;&nbsp;&nbsp;&nbsp;Senior Vice President</option>
<option value='Vice President'>&nbsp;&nbsp;&nbsp;&nbsp;Vice President</option>
<option value='Director & Heads' class='multiselect-all'>Director & Heads</option>
<option value='Administrative Director '>&nbsp;&nbsp;&nbsp;&nbsp;Administrative Director </option>
<option value='Sales Director'>&nbsp;&nbsp;&nbsp;&nbsp;Sales Director</option>
<option value='Associate Director'>&nbsp;&nbsp;&nbsp;&nbsp;Associate Director</option>
<option value='Business Development Director'>&nbsp;&nbsp;&nbsp;&nbsp;Business Development Director</option>
<option value='Commercial Director'>&nbsp;&nbsp;&nbsp;&nbsp;Commercial Director</option>
<option value='Country Director'>&nbsp;&nbsp;&nbsp;&nbsp;Country Director</option>
<option value='Country Head'>&nbsp;&nbsp;&nbsp;&nbsp;Country Head</option>
<option value='Global Head'>&nbsp;&nbsp;&nbsp;&nbsp;Global Head</option>
<option value='Department Head'>&nbsp;&nbsp;&nbsp;&nbsp;Department Head</option>
<option value='Creative Director'>&nbsp;&nbsp;&nbsp;&nbsp;Creative Director</option>
<option value='Executive Director '>&nbsp;&nbsp;&nbsp;&nbsp;Executive Director </option>
<option value='National Director'>&nbsp;&nbsp;&nbsp;&nbsp;National Director</option>
<option value='Senior Director'>&nbsp;&nbsp;&nbsp;&nbsp;Senior Director</option>
<option value='Managers-Associates-Consultants' class='multiselect-all'>Managers-Associates-Consultants</option>
<option value='General Manager'>&nbsp;&nbsp;&nbsp;&nbsp;General Manager</option>
<option value='Portfolio Manager'>&nbsp;&nbsp;&nbsp;&nbsp;Portfolio Manager</option>
<option value='Regional Manager'>&nbsp;&nbsp;&nbsp;&nbsp;Regional Manager</option>
<option value='Investment Manager'>&nbsp;&nbsp;&nbsp;&nbsp;Investment Manager</option>
<option value='Investment Consultant'>&nbsp;&nbsp;&nbsp;&nbsp;Investment Consultant</option>
<option value='Venture Capital Associate'>&nbsp;&nbsp;&nbsp;&nbsp;Venture Capital Associate</option>
<option value='Venture Capital Investor'>&nbsp;&nbsp;&nbsp;&nbsp;Venture Capital Investor</option>
<option value='Venture Consultant'>&nbsp;&nbsp;&nbsp;&nbsp;Venture Consultant</option>
<option value='Executive Assistant'>&nbsp;&nbsp;&nbsp;&nbsp;Executive Assistant</option>
<option value='Consultants'>&nbsp;&nbsp;&nbsp;&nbsp;Consultants</option>
<option value='General Counsel / Corporate Counsel'>&nbsp;&nbsp;&nbsp;&nbsp;General Counsel / Corporate Counsel</option>
<option value='Venture Analyst '>&nbsp;&nbsp;&nbsp;&nbsp;Venture Analyst </option>
<option value='Venture Partner'>&nbsp;&nbsp;&nbsp;&nbsp;Venture Partner</option>
<option value='Executive Assistant'>&nbsp;&nbsp;&nbsp;&nbsp;Executive Assistant</option>
<option value='Advisor (Technical / Corporate / Financial / Fund / Industry / Investment)'>&nbsp;&nbsp;&nbsp;&nbsp;Advisor (Technical / Corporate / Financial / Fund / Industry / Investment)</option>
<option value='Others' class='multiselect-all'>Others</option>
<option value='Academic Programs'>&nbsp;&nbsp;&nbsp;&nbsp;Academic Programs</option>
<option value='Accounts'>&nbsp;&nbsp;&nbsp;&nbsp;Accounts</option>
<option value='Client Marketing / Operations'>&nbsp;&nbsp;&nbsp;&nbsp;Client Marketing / Operations</option>
<option value='Community Director /Manager'>&nbsp;&nbsp;&nbsp;&nbsp;Community Director /Manager</option>
<option value='Compliance Analyst / Associate'>&nbsp;&nbsp;&nbsp;&nbsp;Compliance Analyst / Associate</option>
<option value='Compliance Associate'>&nbsp;&nbsp;&nbsp;&nbsp;Compliance Associate</option>
<option value='Controller'>&nbsp;&nbsp;&nbsp;&nbsp;Controller</option>
<option value='Employment Partner'>&nbsp;&nbsp;&nbsp;&nbsp;Employment Partner</option>
<option value='Entrepreneur-in-Residence'>&nbsp;&nbsp;&nbsp;&nbsp;Entrepreneur-in-Residence</option>
<option value='Graphic Designer'>&nbsp;&nbsp;&nbsp;&nbsp;Graphic Designer</option>
<option value='Human Resources'>&nbsp;&nbsp;&nbsp;&nbsp;Human Resources</option>
<option value='Librarian'>&nbsp;&nbsp;&nbsp;&nbsp;Librarian</option>
<option value='Mentor-in-Residence'>&nbsp;&nbsp;&nbsp;&nbsp;Mentor-in-Residence</option>
<option value='Mortgage Loan Officer'>&nbsp;&nbsp;&nbsp;&nbsp;Mortgage Loan Officer</option>
<option value='Product Designer'>&nbsp;&nbsp;&nbsp;&nbsp;Product Designer</option>
<option value='Professor'>&nbsp;&nbsp;&nbsp;&nbsp;Professor</option>
<option value='Program Administrator / Coordinator / Manager'>&nbsp;&nbsp;&nbsp;&nbsp;Program Administrator / Coordinator / Manager</option>
<option value='Secretary'>&nbsp;&nbsp;&nbsp;&nbsp;Secretary</option>
<option value='Shareholder'>&nbsp;&nbsp;&nbsp;&nbsp;Shareholder</option>
<option value='Software Engineer'>&nbsp;&nbsp;&nbsp;&nbsp;Software Engineer</option>
<option value='Software Engineer'>&nbsp;&nbsp;&nbsp;&nbsp;Software Engineer</option>
<option value='Student'>&nbsp;&nbsp;&nbsp;&nbsp;Student</option>
<option value='Tax Director / Manager'>&nbsp;&nbsp;&nbsp;&nbsp;Tax Director / Manager</option>
<option value='Trader'>&nbsp;&nbsp;&nbsp;&nbsp;Trader</option>
<option value='Traffic Manager'>&nbsp;&nbsp;&nbsp;&nbsp;Traffic Manager</option>
<option value='Training & Education'>&nbsp;&nbsp;&nbsp;&nbsp;Training & Education</option>
<option value='Treasurer'>&nbsp;&nbsp;&nbsp;&nbsp;Treasurer</option>
<option value='UX/Creative Director'>&nbsp;&nbsp;&nbsp;&nbsp;UX/Creative Director</option>
<option value='Web Designer/Developer'>&nbsp;&nbsp;&nbsp;&nbsp;Web Designer/Developer</option>


</select> <br>
			</div> 
			</div>
			</div>



			 <div class="well col-lg-12 col-sm-12">
			<div class="row">
			  <div class="col-lg-2 col-sm-3 col-xs-12" >  
			<b> Domain :</b></div>
			 <div class="col-lg-10 col-sm-8 col-xs-12"> 
			 <select  name="Domain[]" id="ddlDomain" multiple="multiple" class=" form-control"><option value="46">Women in Technology</option><option value="1">3D Printing</option><option value="2">Advertising/Media/Marketing/Social</option><option value="3">Automotive</option><option value="4">Big Data</option><option value="5">Biometrics</option><option value="6">Clean Tech/Alternate Energy</option><option value="7">Cloud /IT/Infra/Security</option><option value="8">Curated Web</option><option value="9">Design/UI/UX</option><option value="10">Digital Health/Healthcare</option><option value="11">Drones</option><option value="13">Education/Online Learning</option><option value="14">Enterprise Software</option><option value="15">Fashion</option><option value="16">Film/Motion Picture</option><option value="17">Fintech</option><option value="19">Gaming/Online Entertainment</option><option value="22">Home Automation</option><option value="24">Internet of Things (IoT)</option><option value="26">Machine Learning</option><option value="27">Manufacturing</option><option value="28">mCommerce</option><option value="29">Mobile Location Technologies</option><option value="30">Mobile Messaging</option><option value="31">Nanotech</option><option value="33">Online Shopping</option><option value="36">Robotics</option><option value="37">Semiconductor</option><option value="38">Smart Cities</option><option value="39">Software Defined Networks</option><option value="40">Travel</option><option value="41">Video Streaming</option><option value="42">Virtual Reality/Augmented Reality</option><option value="43">Wearables</option><option value="44">Wireless/Telecom</option><option value="45">Social Entrepreneurship</option><option value="47">Startups</option><option value="48">Angel &amp; VC Investments</option><option value="49">Consumer Batteries</option><option value="50">Cloud Services</option><option value="51">Augmented Reality</option><option value="52">Data Center</option><option value="53">TiEcon 2017</option><option value="54">Gaming VC</option><option value="55">Machine Learning VC</option><option value="56">Media</option><option value="57">CIO</option><option value="58">autonomous vehicles</option><option value="59">Cloud Security</option><option value="60">EdTech</option></select>  <br>
			 </div></div></div>
		
			<div class="well col-lg-12 col-sm-12">
			<div class="row">
			  <div class="col-lg-2 col-sm-3 col-xs-12" >  
    		<b> Company :</b></div>
			 <div class="col-lg-10 col-sm-8 col-xs-12"> 

			  <select name="Company[]" id="ddlCompany" multiple="multiple"  class=" form-control">
				<option value='American Discovery Capital LLC'>American Discovery Capital LLC</option>
				<option value='Artist Capital LLC'>Artist Capital LLC</option>
				<option value='Asgaard Capital LLC'>Asgaard Capital LLC</option>
				<option value='ASGARD Partners & Co., LLC'>ASGARD Partners & Co., LLC</option>
				<option value='Avendus Capital Private Ltd.'>Avendus Capital Private Ltd.</option>
				<option value='B. Riley & Co., LLC'>B. Riley & Co., LLC</option>
				<option value='BDT Capital Partners, LLC'>BDT Capital Partners, LLC</option>
				<option value='Berenson Minella & Company'>Berenson Minella & Company</option>
				<option value='BG Strategic Advisors, LLC'>BG Strategic Advisors, LLC</option>
				<option value='Blue Beacon Capital LLC'>Blue Beacon Capital LLC</option>
				<option value='BMO Capital Markets Corp.'>BMO Capital Markets Corp.</option>
				<option value='Boston Meridian, LLC'>Boston Meridian, LLC</option>
				<option value='Broadband Capital Management LLC'>Broadband Capital Management LLC</option>
				<option value='Broadhaven Capital Partners, LLC'>Broadhaven Capital Partners, LLC</option>
				<option value='Broadmark Capital, LLC'>Broadmark Capital, LLC</option>
				<option value='Brown Brothers Harriman & Co.'>Brown Brothers Harriman & Co.</option>
				<option value='Cappello Global, LLC'>Cappello Global, LLC</option>
				<option value='Catalina Securities'>Catalina Securities</option>
				<option value='China Development Industrial Bank, Inc.'>China Development Industrial Bank, Inc.</option>
				<option value='CEA Capital Advisors'>CEA Capital Advisors</option>
				<option value='City Capital Advisors, LLC'>City Capital Advisors, LLC</option>
				<option value='Clearsight Advisors, Inc.'>Clearsight Advisors, Inc.</option>
				<option value='CREO Montminy & Co., LLC'>CREO Montminy & Co., LLC</option>
				<option value='Demeter Advisory Group, LLC '>Demeter Advisory Group, LLC </option>
				<option value='Dominick & Dickerman LLC'>Dominick & Dickerman LLC</option>
				<option value='East Wind Advisors, LLC'>East Wind Advisors, LLC</option>
				<option value='G.C. Andersen Partners, LLC'>G.C. Andersen Partners, LLC</option>
				<option value='Genesis Capital LLC'>Genesis Capital LLC</option>
				<option value='GLC Advisors & Co., LLC'>GLC Advisors & Co., LLC</option>
				<option value='Global Healthcare Advisors, LLC'>Global Healthcare Advisors, LLC</option>
				<option value='Goldman Sachs Merchant Banking Division'>Goldman Sachs Merchant Banking Division</option>
				<option value='Good Harbor Partners Acquisition Corp.'>Good Harbor Partners Acquisition Corp.</option>
				<option value='Grail Partners, LLC'>Grail Partners, LLC</option>
				<option value='Grove Capital Partners, LLC'>Grove Capital Partners, LLC</option>
				<option value='GSV Advisors, LLC'>GSV Advisors, LLC</option>
				<option value='Harpeth Capital, LLC'>Harpeth Capital, LLC</option>
				<option value='Headwaters MB, LLC'>Headwaters MB, LLC</option>
				<option value='Healthcare Growth Partners, LLC'>Healthcare Growth Partners, LLC</option>
				<option value='Innovation Advisors, LLC'>Innovation Advisors, LLC</option>
				<option value='Kirchner Private Capital Group'>Kirchner Private Capital Group</option>
				<option value='MDB Capital Group, LLC'>MDB Capital Group, LLC</option>
				<option value='Media Services Group, Inc.'>Media Services Group, Inc.</option>
				<option value='Middlemarch Partners LLC'>Middlemarch Partners LLC</option>
				<option value='Morgan Joseph TriArtisan LLC'>Morgan Joseph TriArtisan LLC</option>
				<option value='Morpheus Capital Advisors LLC'>Morpheus Capital Advisors LLC</option>
				<option value='MTS Health Partners, L.P.'>MTS Health Partners, L.P.</option>
				<option value='National Bank Financial, Inc.'>National Bank Financial, Inc.</option>
				<option value='Navidar Holdco LLC'>Navidar Holdco LLC</option>
				<option value='Noble Grossart Ltd.'>Noble Grossart Ltd.</option>
				<option value='o3 Capital Global Advisory Pvt Ltd.'>o3 Capital Global Advisory Pvt Ltd.</option>
				<option value='Oasis Capital Partners, LLC'>Oasis Capital Partners, LLC</option>
				<option value='Ocean Tomo, LLC'>Ocean Tomo, LLC</option>
				<option value='Opus Bank'>Opus Bank</option>
				<option value='Origin Merchant'>Origin Merchant</option>
				<option value='Ov2 Securities, Inc.'>Ov2 Securities, Inc.</option>
				<option value='Partnership Capital Growth, LLC'>Partnership Capital Growth, LLC</option>
				<option value='Portico Capital Securities LLC'>Portico Capital Securities LLC</option>
				<option value='PowerOne Capital Markets Limited'>PowerOne Capital Markets Limited</option>
				<option value='Quayle Munro Limited'>Quayle Munro Limited</option>
				<option value='RainMaker Securities, LLC'>RainMaker Securities, LLC</option>
				<option value='Regions Financial Corporation'>Regions Financial Corporation</option>
				<option value='River Branch Holdings, LLC'>River Branch Holdings, LLC</option>
				<option value='Rothschild & Co SCA'>Rothschild & Co SCA</option>
				<option value='SenaHill Partners, L.P.'>SenaHill Partners, L.P.</option>
				<option value='Siemer & Associates, LLC'>Siemer & Associates, LLC</option>
				<option value='Silicon Valley Bank, Inc.'>Silicon Valley Bank, Inc.</option>
				<option value='Spencer House Partners LLP'>Spencer House Partners LLP</option>
				<option value='Spencer Pierce Capital LLC'>Spencer Pierce Capital LLC</option>
				<option value='Stone Key Partners LLC'>Stone Key Partners LLC</option>
				<option value='Sword, Rowe & Company LLC'>Sword, Rowe & Company LLC</option>
				<option value='The Chesapeake Group'>The Chesapeake Group</option>
				<option value='The Goldman Sachs Group, Inc.'>The Goldman Sachs Group, Inc.</option>
				<option value='The Legend Merchant, LLC'>The Legend Merchant, LLC</option>
				<option value='The Raine Group LLC'>The Raine Group LLC</option>
				<option value='The Sage Group, LLC'>The Sage Group, LLC</option>
				<option value='Tudor, Pickering, Holt & Company LLC'>Tudor, Pickering, Holt & Company LLC</option>
				<option value='Vaquero Capital, Inc.'>Vaquero Capital, Inc.</option>
				<option value='Waveland Capital Group LLC'>Waveland Capital Group LLC</option>
				<option value='Wellington Shields & Co. LLC'>Wellington Shields & Co. LLC</option>
				<option value='Windom Peaks Capital, LLC'>Windom Peaks Capital, LLC</option>
				<option value='1% Club'>1% Club</option>
				<option value='Zeva Capsol Pvt Ltd. (1Crowd)'>Zeva Capsol Pvt Ltd. (1Crowd)</option>
				<option value='1001PACT SAS'>1001PACT SAS</option>
				<option value='ACG Capital SA'>ACG Capital SA</option>
				<option value='Agency  2.0, Inc.'>Agency  2.0, Inc.</option>
				<option value='AktieTorget AB'>AktieTorget AB</option>
				<option value='OOO Aktivo'>OOO Aktivo</option>
				<option value='Allbright Group Limited'>Allbright Group Limited</option>
				<option value='AlphaCrowd Limited'>AlphaCrowd Limited</option>
				<option value='AltaClub'>AltaClub</option>
				<option value='AngelList LLC'>AngelList LLC</option>
				<option value='Angelr'>Angelr</option>
				<option value='Angels Den Funding Ltd.'>Angels Den Funding Ltd.</option>
				<option value='appbackr, Inc.'>appbackr, Inc.</option>
				<option value='Asiola Co. Ltd.'>Asiola Co. Ltd.</option>
				<option value='Asset Match Ltd.'>Asset Match Ltd.</option>
				<option value='Asure Software, Inc.'>Asure Software, Inc.</option>
				<option value='ABC Microfinance SAS (Babyloan)'>ABC Microfinance SAS (Babyloan)</option>
				<option value='Bergfurst AG'>Bergfurst AG</option>
				<option value='Huddletech Services Private Limited (BitGiving)'>Huddletech Services Private Limited (BitGiving)</option>
				<option value='BlazeFund'>BlazeFund</option>
				<option value='BnkToTheFuture Ltd.'>BnkToTheFuture Ltd.</option>
				<option value='Bolden'>Bolden</option>
				<option value='PayNearMe MT, Inc.'>PayNearMe MT, Inc.</option>
				<option value='Breakaway Funding LLC'>Breakaway Funding LLC</option>
				<option value='Bulb in Town SAS'>Bulb in Town SAS</option>
				<option value='Capital Cell'>Capital Cell</option>
				<option value='Starting Blocks Media Ventures Pvt. Ltd. (Catapooolt)'>Starting Blocks Media Ventures Pvt. Ltd. (Catapooolt)</option>
				<option value='CircleUp Network, Inc.'>CircleUp Network, Inc.</option>
				<option value='CityVest Capital Inc.'>CityVest Capital Inc.</option>
				<option value='Companisto GmbH'>Companisto GmbH</option>
				<option value='Crowd2Fund Limited'>Crowd2Fund Limited</option>
				<option value='Crowdcube Limited'>Crowdcube Limited</option>
				<option value='Crowdfunder, Inc.'>Crowdfunder, Inc.</option>
				<option value='The Justice Platform Ltd. (CrowdJustice)'>The Justice Platform Ltd. (CrowdJustice)</option>
				<option value='Crowdmatrix Inc.'>Crowdmatrix Inc.</option>
				<option value='Crowdonomic Media Pte Ltd. (Crowdo)'>Crowdonomic Media Pte Ltd. (Crowdo)</option>
				<option value='CrowdRise, Inc.'>CrowdRise, Inc.</option>
				<option value='CrowdSmart, Inc.'>CrowdSmart, Inc.</option>
				<option value='Return on Change, Inc. (DarcMatter)'>Return on Change, Inc. (DarcMatter)</option>
				<option value='Das Bank'>Das Bank</option>
				<option value='Beijing Time Technology Co. Ltd. (Demohour)'>Beijing Time Technology Co. Ltd. (Demohour)</option>
				<option value='DreamFunded Marketplace, LLC'>DreamFunded Marketplace, LLC</option>
				<option value='Emerging Crowd Ltd.'>Emerging Crowd Ltd.</option>
				<option value='Envestors Limited'>Envestors Limited</option>
				<option value='Envestors MENA LLC'>Envestors MENA LLC</option>
				<option value='Equinvest S.r.l.'>Equinvest S.r.l.</option>
				<option value='Equitise Pty Ltd.'>Equitise Pty Ltd.</option>
				<option value='EquityEats, Inc.'>EquityEats, Inc.</option>
				<option value='EquityNet LLC'>EquityNet LLC</option>
				<option value='FashionFund LLC'>FashionFund LLC</option>
				<option value='Loose Tooth Industries, Inc. (Fig)'>Loose Tooth Industries, Inc. (Fig)</option>
				<option value='Finnest GmbH'>Finnest GmbH</option>
				<option value='FINAC Ry'>FINAC Ry</option>
				<option value='FinShi Capital'>FinShi Capital</option>
				<option value='FlashFunders Securities LLC'>FlashFunders Securities LLC</option>
				<option value='Florida Funders, LLC'>Florida Funders, LLC</option>
				<option value='The Florida Venture Forum, Inc.'>The Florida Venture Forum, Inc.</option>
				<option value='Fondeadora de México, S.A.P.I. de C.V.'>Fondeadora de México, S.A.P.I. de C.V.</option>
				<option value='FrontFundr'>FrontFundr</option>
				<option value='Fundable LLC'>Fundable LLC</option>
				<option value='Fundacity Inc.'>Fundacity Inc.</option>
				<option value='FundedByMe AB'>FundedByMe AB</option>
				<option value='Funded Here Pte. Ltd.'>Funded Here Pte. Ltd.</option>
				<option value='FunderNation'>FunderNation</option>
				<option value='Fundify'>Fundify</option>
				<option value='Fundlift'>Fundlift</option>
				<option value='Fundme SAS'>Fundme SAS</option>
				<option value='Fundnel Pte Ltd.'>Fundnel Pte Ltd.</option>
				<option value='ConnectionPoint Systems Inc. (FundRazr)'>ConnectionPoint Systems Inc. (FundRazr)</option>
				<option value='Geldvoorelkaar'>Geldvoorelkaar</option>
				<option value='Globevestor, Inc.'>Globevestor, Inc.</option>
				<option value='GoFundMe, Inc.'>GoFundMe, Inc.</option>
				<option value='Gold Eagle Funding Inc.'>Gold Eagle Funding Inc.</option>
				<option value='Green Rocket, GmbH'>Green Rocket, GmbH</option>
				<option value='GREX Alternative Investments Market Pvt Ltd.'>GREX Alternative Investments Market Pvt Ltd.</option>
				<option value='Growthdeck Ltd.'>Growthdeck Ltd.</option>
				<option value='GrowthFunders'>GrowthFunders</option>
				<option value='Healthfundr, Inc.'>Healthfundr, Inc.</option>
				<option value='Hoolders'>Hoolders</option>
				<option value='iAngels Crowd Ltd.'>iAngels Crowd Ltd.</option>
				<option value='iCrowdNewswire'>iCrowdNewswire</option>
				<option value='iEstate GmbH (iFunded)'>iEstate GmbH (iFunded)</option>
				<option value='Indie Crowd Funder, LLC'>Indie Crowd Funder, LLC</option>
				<option value='Indiegogo, Inc.'>Indiegogo, Inc.</option>
				<option value='Inkshares, Inc.'>Inkshares, Inc.</option>
				<option value='Invesdor'>Invesdor</option>
				<option value='Investiere AG'>Investiere AG</option>
				<option value='Giving.com Limited'>Giving.com Limited</option>
				<option value='KaiStart'>KaiStart</option>
				<option value='kapilendo AG'>kapilendo AG</option>
				<option value='Kentaa B.V'>Kentaa B.V</option>
				<option value='Kiririnki Oy'>Kiririnki Oy</option>
				<option value='KissKissBankBank & Co.'>KissKissBankBank & Co.</option>
				<option value='Kobo Capital Ltd.'>Kobo Capital Ltd.</option>
				<option value='KoreConX Corp.'>KoreConX Corp.</option>
				</select>
</div></div></div> <br>
					<div class="well col-lg-12 col-sm-12">
					<div class="row">
			  <div class="col-lg-2 col-sm-3 col-xs-12" > 
    		<b> Location :</b></div>
				 <div class="col-lg-10 col-sm-8 col-xs-12"> 
				<select name="Location" id="ddlLocation" multiple="multiple" class=" form-control">
<option value='USA'>USA</option>
<option value='United Kingdom'>United Kingdom</option>
<option value='Australia'>Australia</option>
<option value='France'>France</option>
<option value='Germany'>Germany</option>
<option value='Canada'>Canada</option>
<option value='Austria'>Austria</option>
<option value='Bahamas'>Bahamas</option>
<option value='Bahrain'>Bahrain</option>
<option value='Belgium'>Belgium</option>
<option value='Bermuda'>Bermuda</option>
<option value='Brazil'>Brazil</option>
<option value='Bulgaria'>Bulgaria</option>

<option value='Cayman Islands'>Cayman Islands</option>
<option value='Chile'>Chile</option>
<option value='China'>China</option>
<option value='Croatia'>Croatia</option>
<option value='Cyprus'>Cyprus</option>
<option value='Czech Republic'>Czech Republic</option>
<option value='Denmark'>Denmark</option>
<option value='Estonia'>Estonia</option>
<option value='Finland'>Finland</option>

<option value='Gibraltar'>Gibraltar</option>
<option value='Greece'>Greece</option>
<option value='Hong Kong'>Hong Kong</option>
<option value='Hungary'>Hungary</option>
<option value='Iceland'>Iceland</option>
<option value='India'>India</option>
<option value='Indonesia'>Indonesia</option>
<option value='Ireland'>Ireland</option>
<option value='Isle of Man'>Isle of Man</option>
<option value='Israel'>Israel</option>
<option value='Italy'>Italy</option>
<option value='Japan'>Japan</option>
<option value='Kenya'>Kenya</option>
<option value='Korea'>Korea</option>
<option value='Kuwait'>Kuwait</option>
<option value='Latvia'>Latvia</option>
<option value='Lebanon'>Lebanon</option>
<option value='Lithuania'>Lithuania</option>
<option value='Luxembourg'>Luxembourg</option>
<option value='Malaysia'>Malaysia</option>
<option value='Malta'>Malta</option>
<option value='Mauritius'>Mauritius</option>
<option value='Mexico'>Mexico</option>
<option value='Netherlands'>Netherlands</option>
<option value='New Zealand'>New Zealand</option>
<option value='Nigeria'>Nigeria</option>
<option value='Norway'>Norway</option>
<option value='Palestine'>Palestine</option>
<option value='Philippines'>Philippines</option>
<option value='Poland'>Poland</option>
<option value='Portugal'>Portugal</option>
<option value='Romania'>Romania</option>
<option value='Russia'>Russia</option>
<option value='Saudi Arabia'>Saudi Arabia</option>
<option value='Singapore'>Singapore</option>
<option value='Slovakia'>Slovakia</option>
<option value='Slovenia'>Slovenia</option>
<option value='South Africa'>South Africa</option>
<option value='South Korea'>South Korea</option>
<option value='Spain'>Spain</option>
<option value='Sweden'>Sweden</option>
<option value='Switzerland'>Switzerland</option>
<option value='Taiwan'>Taiwan</option>
<option value='Thailand'>Thailand</option>
<option value='The Netherlands'>The Netherlands</option>
<option value='Turkey'>Turkey</option>
<option value='UAE'>UAE</option>
<option value='Ukraine'>Ukraine</option>
<option value='Uruguay'>Uruguay</option>

</select> </div></div></div><br>

				<div class="well col-lg-12 col-sm-12">
				<div class="row">
				<div class="col-lg-2 col-sm-3 col-xs-12" > 
				<b> Free Text Search :</b></div>
				<div class="col-lg-10 col-sm-8 col-xs-12"> 
				<input type="text" class=" form-control"  Placeholder="Search for free text" name="find" />
				</div></div></div><br>
				<div class="col-lg-10 col-sm-8 col-xs-12"> 
				<input type="submit" class=" form-control" name="search" value="Search" />
				</div>
			</form>


	
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