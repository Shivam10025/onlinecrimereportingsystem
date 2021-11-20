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
$conn = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
    // Check Connection
 
    $sql = "SELECT * from c_table ORDER BY id ";
    $db_data = array();
 
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            $db_data[] = $row;
        }
        // Send back the complete records as a json
        echo json_encode($db_data);
    }else{
        echo "error";
    }
    
    $conn->close();
    
    return;
 
?>
