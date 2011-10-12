<?php
define("DB_SERVER","localhost");
define("DB_USER","root");
define("DB_PASS","");
define("DB_NAME","as3basics");
class ScoreService {
	private $conn;
	
	private function connect() {
		$this->conn = mysql_connect(DB_SERVER, DB_USER, DB_PASS);
		mysql_select_db(DB_NAME,$this->conn);
	}
	
	private function query($query){
		$response = mysql_query($query,$this->conn);
		$result = array();
		while($row = mysql_fetch_assoc($response)){
			array_push($result,$row);
		}
		return $result;
	}
	
	private function close(){
		mysql_close($this->conn);
	}
	
	public function getHighScores() {
		$this->connect();
		$result = $this->query("SELECT p.name, max(s.score) as score 
							   FROM players  p JOIN score s ON p.id = s.player_id 
							   GROUP BY p.id 
							   ORDER BY score DESC 
							   LIMIT 3");
		$this->close();
		return $result;
	}
	
	public function sayHello(){
		return "Hello";
	}
}
?>