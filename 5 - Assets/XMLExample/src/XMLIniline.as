package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author matix
	 */
	public class XMLIniline extends Sprite 
	{
		
		public function XMLIniline():void 
		{
			var xml:XML = 
			<root>
				<student name="Matias" surname="Figueroa">
					<course name="Algoritmos">
						<exam date="25/03/2011" score="10">Primer Parcial</exam>
						<exam date="25/04/2011" score="7">Segundo Parcial</exam>
						<exam date="25/05/2011" score="7">Trabajo Practico Integrador</exam>
					</course>				
					<course name="Administracion de Recursos">
						<exam date="30/03/2011" score="8">Primer Parcial</exam>
						<exam date="4/04/2011" score="7">Segundo Parcial</exam>
						<exam date="4/04/2011" score="6">Tercer Parcial</exam>
						<exam date="12/05/2011" score="9">Trabajo Practico Integrador</exam>
					</course>
				</student>				
				<student name="Miguel" surname="Vargas">
					<course name="Algoritmos">
						<exam date="25/03/2011" score="9">Primer Parcial</exam>
						<exam date="25/04/2011" score="9">Segundo Parcial</exam>
						<exam date="25/05/2011" score="8">Trabajo Practico Integrador</exam>
					</course>
					<course name="Analisis Matematico">
						<exam date="25/03/2011" score="9">Primer Parcial</exam>
						<exam date="25/04/2011" score="9">Segundo Parcial</exam>
					</course>				
				</student>
			</root>
			
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