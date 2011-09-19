package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author matix
	 */
	public class TextFieldDemo extends Sprite
	{
		
		public function TextFieldDemo() 
		{
			var display:TextField = new TextField();  
			var input:TextField = new TextField();  

			addChild(display);  
			addChild(input);  
			  
			display.text = "flash rocks!";  
			display.width = 250;  
			display.x = 25;  
			display.y = 25;  
			  
			display.selectable = false;   
			  
			display.autoSize = TextFieldAutoSize.LEFT;  
			  
			var myFormat:TextFormat = new TextFormat();  
			  
			myFormat.color = 0xAA0000;   
			  
			myFormat.size = 80;  
			  
			myFormat.italic = true;  
			  
			display.setTextFormat(myFormat);
			
			input.x = input.y = 200;
			input.text = "flash..."
			input.setTextFormat(myFormat);
			input.width = 350;
			input.border = true;
			input.type = TextFieldType.INPUT;
		}
		
	}

}