package
{
	import flashes.tolders.NativeLayaBoxRetolder;
	
	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.display.Text;
	import laya.events.Event;
	
	import layas.rects.LitaRect;
	
	import prisms.mediators.Arrester;
	import prisms.uis.buttons.BaseButton;
	import prisms.views.tenteis.uis.BaseTent;
	import prisms.views.tenteis.uis.PrepareTent;
	
	/**
	 * 蒙眼猜拳 
	 * <br/>
	 * 尽可能的写少一点代码来完成作品
	 * <br/>
	 * LayaBox版的文档类
	 * <br/>
	 * 这里可以尽情的使用LayaBox的API
	 */
	public class LayaBoxBlindMorra
	{
		
		/**
		 * 蒙眼猜拳 
		 * <br/>
		 * 尽可能的写少一点代码来完成作品
		 * <br/>
		 * LayaBox版的文档类
		 * <br/>
		 * 这里可以尽情的使用LayaBox的API
		 */
		public function LayaBoxBlindMorra()
		{
			trace("LayBox Blind Morra");
			
			// Arrester模式
			
			Laya.init(800, 450);
			Laya.stage.bgColor = "#FFFFFF";
			
			// return;
			onAdded(null);
			
			
		}
		
		/**
		 * 获取舞台之后 进行初始化工作 
		 */
		protected function onAdded(event:Event):void
		{
			// Laya.stage.scaleMode = Stage.SCALE_NOSCALE
			
			initBlindMorra();
			
			
		}
		
		/**
		 * 正式初始化
		 */
		private function initBlindMorra():void
		{
			initForTotalSettings();
			
			initLoadData();
			
			// initButtonText();
		}
		
		private var baseButton:BaseButton;
		
		/**
		 * 按钮文本显示测试
		 */
		private function initButtonText():void
		{
			baseButton = new BaseButton("a");
			
			baseButton.addEventListener(Arrester.retolder.click, onClick, this);
			
			Arrester.retolder.setProperty(baseButton, 100, "x");
			Arrester.retolder.setProperty(baseButton, 100, "y");
			
			Arrester.retolder.addChildToParent(baseButton.mainContainer, Arrester.stage);
		}		
		
		private var tempIndex:int = 0;
		
		private function onClick(event:Object):void
		{
			var arr:Array = ["对", "吃饭", "打麻将打麻将"];
			
			var text:String = arr[tempIndex];
			
			tempIndex++;
			tempIndex = tempIndex >= 3 ? 0 : tempIndex;
			
			baseButton.labelText = text;
		}
		
		/**
		 * 总管理器测试
		 * <br/>
		 * 游戏程序入口
		 */
		private function initForTotalSettings():void
		{
			Arrester.injectToManager({retolder: NativeLayaBoxRetolder});
			
			Arrester.stage = Laya.stage;
			
			
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
			
//			var rect:LitaRect = new LitaRect(100, 100, 0xFFFF00);
//			
//			Laya.stage.addChild(rect);
			
//			var tent:BaseTent = new PrepareTent(0xFFF000);
////			var tent:BaseTent = new BaseTent(0xFF0F00);
//			
//			Laya.stage.addChild(Sprite(tent.mainContainer));
			
			prepareTent = Arrester.uiTentManager.standardToPrepareTent();
			
			Arrester.retolder.addChildToParent(prepareTent.mainContainer, Arrester.stage);
			
			// trace(initLoadData);
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