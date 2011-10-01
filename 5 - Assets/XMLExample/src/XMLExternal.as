package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author matix
	 */
	public class XMLExternal extends Sprite 
	{
		
		public function XMLExternal():void 
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest("students.xml");
			loader.addEventListener(Event.COMPLETE, onXMLLoaded);
			
			loader.load(request);
		}
		
		private function onXMLLoaded(e:Event):void 
		{
			var xml:XML = new XML(e.target.data);
			
			trace("Qué materias cursa Matias Figueroa?");
			for each (var course:XML in xml.student.(@name == "Matias" && @surname == "Figueroa").course)
			{
				trace(course.@name);
			}
			
			trace("------------------");
			
			trace("Quienes Cursan Materias que tengan la palabra 'Recursos'?");
			
			for each (var student:XML in xml.student.(course.@name.toString().indexOf("Recursos")>-1)) 
			{
				trace(student.@name);
			}
			
			trace("------------------");
			
			trace("Cuantos Alumnos hay?")
			trace(xml.student.length())			
			
			trace("------------------");
			
			xml.student += <student name="Luis" surname="Eiman"/>
			
			for each (var student:XML in xml.student) 
			{
				trace(student.@name, student.@surname);
			}
			
			trace("Ahora cuantos Alumnos hay?")
			trace(xml.student.length())
			
			trace("------------------");
			
			xml.student.(@surname == "Eiman").@surname = "Perez";
			
			for each (var student:XML in xml.student) 
			{
				trace(student.@name, student.@surname);
			}
			
			trace("Hay algun alumno Perez?")
			trace(xml.student.(@surname == "Perez").@name);
		}
	}
}