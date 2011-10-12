<?php
	define("DB_SERVER","localhost");
	define("DB_USER","root");
	define("DB_PASS","");
	define("DB_NAME","as3basics");
	$conn = mysql_connect(DB_SERVER, DB_USER, DB_PASS) or die("COULD NOT CONNECT TO DB");
	mysql_select_db(DB_NAME,$conn) or die("DB ${DBNAME} DOES NOT EXIST");
	
	$players = mysql_query("SELECT * FROM players",$conn) or die ("ERROR ON QUERY");
	
	header("Content-type: text/xml");
	echo '<?xml version="1.0" ?>';
?>
<data>
	<?php while($player = mysql_fetch_assoc($players)) { ?>
	<player id="<?php echo $player['id']?>" name="<?php echo $player['name']?>"></player>
	<?php } ?>
</data>
<?php mysql_close($conn); ?>