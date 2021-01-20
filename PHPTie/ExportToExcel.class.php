<?php

class ExportToExcel
{  
function exportWithPage($php_page,$excel_file_name)  
{  
$this->setHeader($excel_file_name);   require_once "$php_page";   
}    

function setHeader($excel_file_name)  
{   
header("Content-type: application/octet-stream");  
header("Content-Disposition: attachment; filename=$excel_file_name");  
header("Pragma: no-cache");  
header("Expires: 0");    
}    

function exportWithQuery($qry,$excel_file_name,$conn,$Headding)  
{  
$tmprst=mysql_query($qry,$conn);  


$body=""; 

$fields = mysql_num_fields ($tmprst);

//create csv header row, to contain table headers 
//with database field names
$body.="<tr bgcolor='#D3D3D3'>";
for ( $i = 0; $i < $fields; $i++ ) {
	$body .="<td><b>". mysql_field_name($tmprst , $i ) . "</b></td>";
}
$body.="</tr>";
 $header="<center><table border=1px><th align=left colspan=$i>$Headding</th>"; 
$num_field=mysql_num_fields($tmprst);  
 
while($row=mysql_fetch_array($tmprst,MYSQL_BOTH))  
{    $body.="<tr>";   
for($i=0;$i<$num_field;$i++)   
{     $body.="<td>".$row[$i]."</td>";    }   
$body.="</tr>";   
}  
$this->setHeader($excel_file_name);  
echo $header.$body."</table>";  
}



function exportWithSQLSrvQuery($qry,$excel_file_name,$conn,$Headding)  
{  
//$tmprst=mysql_query($qry,$conn);  
$tmprst = sqlsrv_query($conn, $qry, array(), array("Scrollable" => 'static'));
//$tmprst=sqlsrv_prepare( $conn, $qry );


$body=""; 
		  
$fields = sqlsrv_num_fields ($tmprst);
//echo "No. of fields:=".$fields;
//create csv header row, to contain table headers 
//with database field names
$body.="<tr bgcolor='#D3D3D3'>";
sqlsrv_fetch($tmprst);

foreach( sqlsrv_field_metadata( $tmprst ) as $fieldMetadata ) {
    foreach( $fieldMetadata as $name => $value) {
		if ($name=="Name")
		{
				$body.="<td><b>". $value  . "</b></td>";
		}
      // echo "$name: $value<br />";
    }
     // echo "<br />";
}



//echo $bodyh."<Br>";
//exit;
//for ($i=0;$i<$fields;$i++) {
//	$body.="<td><b>". sqlsrv_get_field($tmprst,$i,SQLSRV_PHPTYPE_STREAM(SQLSRV_ENC_CHAR)) . "</b></td>";
	
//}
//echo sqlsrv_get_field($tmprst , 1 )."  text";
//exit;
$body.="</tr>";
 $header="<center><table border=1px><th align=left colspan=$i>$Headding</th>"; 
$num_field=sqlsrv_num_fields($tmprst);  
//echo $num_field."text";
//exit;
while($row=sqlsrv_fetch_array($tmprst))  
{    $body.="<tr>";   
for($i=0;$i<$num_field;$i++)   
{     $body.="<td>".$row[$i]."</td>";    }   
$body.="</tr>";   
}  
$this->setHeader($excel_file_name);  
echo $header.$body."</table>";

}

} ?>