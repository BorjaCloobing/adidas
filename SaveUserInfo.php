<?php 


require("Connection.php");
require("MySqlQueries.php");

$email = htmlentities($_POST["email"]);
$firstName = htmlentities($_POST["firstName"]);
$lastName = htmlentities($_POST["lastName"]);
$dateOfBirth = htmlentities($_POST["dateOfBirth"]);
$country = htmlentities($_POST["country"]);

$returnValue = array();

if(empty($email) || empty($firstName) || empty($lastName) || empty($dateOfBirth) || empty($country))
{
$returnValue["status"] = "error";
$returnValue["message"] = "Missing required field";
echo json_encode($returnValue);
return;
}

$dao = new MySqlQueries();
$dao->openConnection();
$userDetails = $dao->getUserDetails($email);

if(!empty($userDetails))
{
$returnValue["status"] = "error";
$returnValue["message"] = "User already exists";
echo json_encode($returnValue);
return;
}


$result = $dao->registerUser($email,$firstName,$lastName,$dateOfBirth,$country);

if($result)
{
$returnValue["status"] = "Success";
$returnValue["message"] = "User is registered";
echo json_encode($returnValue);
return;
}

$dao->closeConnection();

?>
