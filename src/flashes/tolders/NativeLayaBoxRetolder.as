package flashes.tolders
{
	import layas.rects.LitaRect;
	
	import retolds.subs.LayaRetolder;
	
	
	/**
	 * 本地用的LayaBox接口翻译器
	 */
	public class NativeLayaBoxRetolder extends LayaRetolder
	{
		
		/**
		 * 本地用的LayaBox接口翻译器
		 */
		public function NativeLayaBoxRetolder()
		{
			super();
		}
		
		override protected function inits():void
		{
			super.inits();
			
			getRect = reloadGetRect;
		}
		
		/**
		 * 获取背景方块
		 */
		private function reloadGetRect(w:Number = 100, h:Number = 100, color:uint = 0xFF8800):Object
		{
			return new LitaRect(w, h, color);
			
		}
		
		
	}
}