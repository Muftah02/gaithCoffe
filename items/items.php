<?php

include "../connect.php";

$categoryid = filterRequest("id");
$userid = filterRequest("usersid");

$stmt = $con->prepare("

    SELECT items1view.*, 1 AS favorite , (items_price - (items_price * items_discount / 100 ))  as itemspricedisount 
    FROM items1view 
    INNER JOIN favorite ON favorite.favorite_itemsid = items1view.items_id AND favorite.favorite_usersid = :userid
    WHERE categories_id = :categoryid
    UNION ALL 
    SELECT *, 0 AS favorite , (items_price - (items_price * items_discount / 100 ))  as itemspricedisount 
    FROM items1view
    WHERE categories_id = :categoryid AND items_id NOT IN (
        SELECT items1view.items_id 
        FROM items1view 
        INNER JOIN favorite ON favorite.favorite_itemsid = items1view.items_id AND favorite.favorite_usersid = :userid
    )
");

// ربط المتغيرات
$stmt->bindParam(':categoryid', $categoryid, PDO::PARAM_INT);
$stmt->bindParam(':userid', $userid, PDO::PARAM_INT);

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

// تحويل جميع القيم إلى نصوص
foreach ($data as &$row) {
    foreach ($row as &$value) {
        $value = (string)$value; // تحويل القيمة إلى نص
    }
}

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}