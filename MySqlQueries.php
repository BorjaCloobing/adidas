<?php
class MySqlQueries {
var $dbhost = null;
var $dbuser = null;
var $dbpass = null;
var $conn = null;
var $dbname = null;
var $result = null;

function __construct() {
$this->dbhost = Connection::$dbhost;
$this->dbuser = Connection::$dbuser;
$this->dbpass = Connection::$dbpass;
$this->dbname = Connection::$dbname;
}

public function openConnection() {
$this->conn = new mysqli($this->dbhost, $this->dbuser, $this->dbpass, $this->dbname);
if (mysqli_connect_errno())
echo new Exception("Could not establish connection with database");
}

public function getConnection() {
return $this->conn;
}

public function closeConnection() {
if ($this->conn != null)
$this->conn->close();
}

public function getUserDetails($email)
{
$returnValue = array();
$sql = "select * from users where email='" . $email . "'";

$result = $this->conn->query($sql);
if ($result != null && (mysqli_num_rows($result) >= 1)) {
$row = $result->fetch_array(MYSQLI_ASSOC);
if (!empty($row)) {
$returnValue = $row;
}
}
return $returnValue;
}


public function getEventDetails()
{
$returnValue = array();
$sql = "select * from event where id= 2";

$result = $this->conn->query($sql);
if ($result != null && (mysqli_num_rows($result) >= 1)) {
$row = $result->fetch_array(MYSQLI_ASSOC);
$temp = array();
    //inserting the team in the temporary array
    $temp['id'] = $row['id'];
    $temp['name']=$row['name'];
    $temp['direcction']=$row['direcction'];
    $temp['bannerImage']=$row['bannerImage'];
    //displaying the array in json format

if (!empty($row)) {
$returnValue = $temp;
}
}
return $returnValue;
}


public function registerUser($email, $firstName, $lastName,$dateOfBirth, $country)
{
$sql = "insert into users set email=?, firstName=?, lastName=?, dateOfBirth=?, country=?";
$statement = $this->conn->prepare($sql);

if (!$statement)
throw new Exception($statement->error);

$statement->bind_param("sssss", $email, $firstName, $lastName, $dateOfBirth, $country);
$returnValue = $statement->execute();

return $returnValue;
}

}
?>
