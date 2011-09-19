package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author matix
	 */
	public class BitmapDemo extends Sprite
	{
		
		public function BitmapDemo() 
		{
			var bd:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true);
			var b:Bitmap = new Bitmap(bd);
			
			for (var i:int = 0; i < b.bitmapData.width; i++) 
			{
				for (var j:int = 0; j < b.bitmapData.height; j++) 
				{
					if (i * i + j * j <= Math.pow(stage.stageHeight, 2)) {
						b.bitmapData.setPixel(i, j, Math.random() * 0xFFFFFF);
					}
					else {
						b.bitmapData.setPixel(i, j, Math.random() * 0xFF);
					}
				}
			}
			
			addChild(b);
		}
		
	}

}