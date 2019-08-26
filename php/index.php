<?php
/**
 * Example PHP file 
 */

if( isset($_GET['uri']) && ( $_GET['uri'] === 'err404' || $_GET['uri'] === 'err403' ) ){
	echo '<h1> Error' . ( $_GET['uri'] == 'err404' ? '404' : '403' ) . '</h1>';
}

phpinfo();
?>