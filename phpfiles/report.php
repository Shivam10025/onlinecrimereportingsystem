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
$email = $obj['email'];
 
// Getting Email from $obj object.
$tc = $obj['tc'];
 
// Getting Password from $obj object.
$cc = $obj['cc'];
$dc = $obj['dc'];
$jc = $obj['jc'];
// Checking whether Email is Already Exist or Not in MySQL Table.
 
	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into c_table (email,tc,cc,dc,jc) values ('$email','$tc','$cc','$dc','$jc')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
		$MSG = 'Complain Registered Successfully' ;
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
?>
