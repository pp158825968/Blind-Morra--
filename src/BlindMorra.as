package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import flashes.sounds.SoundPlayer;
	import flashes.tolders.NativeLayaBoxRetolder;
	
	import layas.tolders.NativeFlashRetolder;
	
	import prisms.mediators.Arrester;
	import prisms.tools.ImageLoadTools;
	import prisms.views.tenteis.uis.PrepareTent;
	
	/**
	 * 蒙眼猜拳 
	 * <br/>
	 * 尽可能的写少一点代码来完成作品
	 * <br/>
	 * Flash版的文档类
	 * <br/>
	 * 这里可以尽情的使用Flash的API
	 */
	public class BlindMorra extends Sprite
	{
		
		/**
		 * 蒙眼猜拳 
		 * <br/>
		 * 尽可能的写少一点代码来完成作品
		 * <br/>
		 * Flash版的文档类
		 * <br/>
		 * 这里可以尽情的使用Flash的API
		 */
		public function BlindMorra()
		{
			trace("Blind Morra");
			
			// Arrester模式
			
			if(stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
				onAdded(null);
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, onAdded);
			}
			
			
			
		}
		
		/**
		 * 获取舞台之后 进行初始化工作 
		 */
		protected function onAdded(event:Event):void
		{
			initBlindMorra();
			
			
		}
		
		/**
		 * 正式初始化
		 */
		private function initBlindMorra():void
		{
			initForTotalSettings();
			
			initLoadData();
		}
		
		/**
		 * 总管理器测试
		 * <br/>
		 * 游戏程序入口
		 */
		private function initForTotalSettings():void
		{
			Arrester.injectToManager({retolder: NativeFlashRetolder});
			
			Arrester.stage = stage;
			
			
		}
		
		/**
		 * 准备幕
		 * <br/>
		 * 也即是初始幕了
		 */
		private var prepareTent:PrepareTent;
		
		/**
		 * 载入初始数据
		 */
		private function initLoadData():void
		{
			// 这里要显示准备幕
			
			prepareTent = Arrester.uiTentManager.standardToPrepareTent();
			
			Arrester.retolder.addChildToParent(prepareTent.mainContainer, Arrester.stage);
			
			onLoadXMLComplete(null);
		}
		
		/**
		 * 完成游戏xml数据加载 
		 */
		protected function onLoadXMLComplete(event:Event):void
		{
			// 移除初始场景
			Arrester.retolder.removeChildToParent(prepareTent.mainContainer);
			
			// 正式进入游戏逻辑的构建部分
			Arrester.nouManager.runToNou();
			
			
		}		
		
		
		
	}
}