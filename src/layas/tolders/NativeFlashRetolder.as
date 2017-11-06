package layas.tolders
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import flashes.rects.SampleWaneRect;
	
	import prisms.mediators.Arrester;
	import prisms.tools.ImageLoadTools;
	
	import retolds.subs.FlashRetolder;
	
	/**
	 * 本地用的Laya接口翻译器
	 */
	public class NativeFlashRetolder extends FlashRetolder
	{
		
		/**
		 * 本地用的Laya接口翻译器
		 */
		public function NativeFlashRetolder()
		{
			super();
		}
		
		override protected function inits():void
		{
			super.inits();
			
			loadImage = reloadLoadImage;
			
			getRect = reloadGetRect;
		}
		
		/**
		 * 让位图对象 通过某个链接从而获取到图片内容
		 */
		private function reloadLoadImage(bitmap:Bitmap, url:String):void
		{
			bitmap.bitmapData = Arrester.getLoadedData(url);
			
		}
		
		/**
		 * 获取背景方块
		 */
		private function reloadGetRect(w:Number = 100, h:Number = 100, color:uint = 0xFF8800):Object
		{
			return new SampleWaneRect(w, h, color);
			
		}
		
		
	}
}