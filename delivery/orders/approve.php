<?php

include "../../connect.php";

$orderid = filterRequest("ordersid");

$userid = filterRequest("usersid");
$deliveryid = filterRequest("deliveryid");

$data = array(
    "orders_status" => 3 , 
    "orders_delivery" => $deliveryid 
);
updateData("orders", $data, "orders_id = $orderid AND orders_status = 2");

// sendGCM("success" , "The Order Has been Approved" , "users$userid" , "none" , "refreshorderpending"); 

insertNotify("الطلب", "الطلب في الطريق", $userid, "users$userid", "none",  "refreshorderpending");
sendGCM("انذار" , "تم قبول الطلب من قبل موظف التوصيل" , "services" , "none" , "none"); 
sendGCM("انذار" , "تم قبول الطلب من قبل موظف التوصيل  " . $deliveryid , "delivery" , "none" , "none"); 