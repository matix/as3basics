package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author matix
	 */
	public class XMLAndObjects extends Sprite
	{
		
		public function XMLAndObjects() 
		{
			var student1:Object = {
				name:"Matias",
				surname:"Figueroa"
			};
			
			var student2:Object = {
				name:"Miguel",
				surname:"Vargas"
			};
			
			var xml:XML = <root></root>;
			
			for each(var obj:Object in [student1, student2]) {
				xml.student += <student name={obj.name} surname={obj.surname}/>
			}
			
			trace(xml.toXMLString());
		}
		
	}

}