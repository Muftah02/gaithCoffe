<?php

$notAuth = "" ; 

include "connect.php" ; 
 
sendGCM("hi"  , "How Are You" , "users16" , "" , "") ; 

echo "Send"  ;

?>