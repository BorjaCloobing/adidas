<?php 


require("Connection.php");
require("MySqlQueries.php");

$returnValue = array();
$dao = new MySqlQueries();
$dao->openConnection();
$eventDetails = $dao->getEventDetails();
if(!empty($eventDetails))
{
$returnValue["status"] = "Success";
$returnValue["message"] = "Event details exists";
echo json_encode($eventDetails);
return;
}


$dao->closeConnection();

?>