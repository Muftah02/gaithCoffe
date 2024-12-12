<?php

include "../../connect.php";

$orderid = filterRequest("ordersid");

$userid = filterRequest("usersid");

$data = array(
    "orders_status" => 4
);

updateData("orders", $data, "orders_id = $orderid AND orders_status = 3");

// sendGCM("success" , "The Order Has been Approved" , "users$userid" , "none" , "refreshorderpending"); 

insertNotify("نجاح", "تم توصيل طلبك", $userid, "users$userid", "none",  "refreshorderpending");


sendGCM("انذار" , "تم توصيل الطلب الي الزبون" , "services" , "none" , "none"); 