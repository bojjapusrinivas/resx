<?php SESSION_START();?>
<?php
include('connection.php');
 
include_once('ExportToExcel.class.php'); 


$exp=new ExportToExcel();

$qry="SELECT User_Name,SurName,Rec_ID FROM TBL_SIS_Applications WHERE CONCAT(User_Name,SurName) LIKE ('%srinivas%')"; 
$qry=$_SESSION['sql'];
//$qry=$GLOBALS['sql'];
//echo $GLOBALS['sqlqry'];
//exit;
$exp->exportWithSQLSrvQuery($qry,"Logins.xls",$conn,"Login Details");


 
?>