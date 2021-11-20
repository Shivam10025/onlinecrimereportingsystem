<?php
 
//Define your Server host name here.
$HostName = "localhost";
 
//Define your MySQL Database Name here.
$DatabaseName = "id17937841_ocmr";
 
//Define your Database User Name here.
$HostUser = "id17937841_root";
 
//Define your Database Password here.
$HostPass = "Sanyam@123456789"; 
 
// Creating MySQL Connection.
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);

 
// Storing the received JSON into $json variable.
$json = file_get_contents('php://input');
 
// Decode the received JSON and Store into $obj variable.
$obj = json_decode($json,true);
 
// Getting name from $obj object.
$name = $obj['name'];
 
// Getting Email from $obj object.
$email = $obj['email'];
 
// Getting Password from $obj object.
$password = $obj['password'];
$gender = $obj['gender'];
$aadhar = $obj['aadhar'];
$address = $obj['address'];
$phone = $obj['phone'];

// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM policetable WHERE email='$email'";

// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));


if(isset($check)){

	 $emailExist = 'Email Already Exist, Please Try Again With New Email Address..!';
	 
	 // Converting the message into JSON format.
	$existEmailJSON = json_encode($emailExist);
	  mysqli_close($con);
	  header('Content-Type: application/json');
	// Echo the message on Screen.
	 echo $existEmailJSON ; 

  }
 else{
 
	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into policetable (name,phone,email,password,address,aadhar,gender) values ('$name','$phone','$email','$password','$address','$aadhar','$gender')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
		$MSG = 'User Registered Successfully' ;
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		// Echo the message.
		 mysqli_close($con);
		 header('Content-Type: application/json');
		 echo $json ;
		 
	 }
	 else{
	      mysqli_close($con);
	      header('Content-Type: application/json');
		echo 'Try Again';
		
	 }
 }
?>
