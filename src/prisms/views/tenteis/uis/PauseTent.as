package prisms.views.tenteis.uis
{
	import prisms.jars.UIKeysJar;
	import prisms.mediators.Arrester;

	/**
	 * 暂停游戏
	 * <br/>
	 * 为了暂停时 可以看到介绍内容 暂停幕应该有打开介绍幕的法子
	 */
	public class PauseTent extends BaseTent
	{
		
		/**
		 * 暂停游戏
		 * <br/>
		 * 为了暂停时 可以看到介绍内容 暂停幕应该有打开介绍幕的法子
		 */
		public function PauseTent(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
			// 暂停幕的背景应该是带透明效果的 这样会好一点
		}
		
		
		/**
		 * 介绍标签
		 */
		private var pauseLabel:Object;
		
		/**
		 * 初始化组件
		 */
		override protected function initComponents():void
		{
			super.initComponents();
			
			initLabels();
			
			initButtons();
			
		}
		
		
		/**
		 * 调整背景颜色和透明度
		 */
		override protected function initBg():void
		{
			retolder.setProperty(bgRect, 0x778668, "color");
			
			retolder.setProperty(bgRect, 0.2, "alpha");
			
		}
		
		/**
		 * 初始化标签组件
		 */
		private function initLabels():void
		{
			// 介绍内容
			var tempPauseText:String = Arrester.getLanguageText(UIKeysJar.PAUSING);
			
			pauseLabel = retolder.getTextField(tempPauseText);
			
		}
		
		/**
		 * 取消暂停 回到游戏
		 * <br/>
		 * 继续游戏的按钮并不直接在这里创建
		 */
		private var stillButton:Object;
		
		/**
		 * 介绍按钮
		 * <br/>
		 * 介绍操作的按钮并不直接在这里创建
		 * <br/>
		 * 点击打开介绍幕
		 */
		private var destructionButton:Object;

		
		/**
		 * 创建按钮
		 */
		private function initButtons():void
		{
			stillButton = Arrester.buttonManager.stillButton;
			
			destructionButton = Arrester.buttonManager.destructionButton;
			
		}
		
		/**
		 * 初始化组建的基本布局
		 */
		override protected function initLayoutComponents():void
		{
			layoutComponents();
		}
		
		/**
		 * 把组件放到舞台上
		 */
		override protected function addComponentsToStage():void
		{
			super.addComponentsToStage();
			
			retolder.addChildToParent(pauseLabel, mainContainer);
			
			retolder.addChildToParent(stillButton.mainContainer, mainContainer);
			
			retolder.addChildToParent(destructionButton.mainContainer, mainContainer);
			
		}
		
		
		/**
		 * 组件布局
		 */
		override protected function layoutComponents():void
		{
			// 对标题进行布局
			var titleWidth:Number = Number(retolder.getProperty(pauseLabel, "width"));
			var titleHeight:Number = Number(retolder.getProperty(pauseLabel, "height"));
			
			
			var marignY:Number = 100;
			var titleX:Number = (width - titleWidth) * 0.5;
			var titleY:Number = (height - titleHeight) * 0.5 - marignY;
			
			retolder.setProperty(pauseLabel, titleX, "x");
			retolder.setProperty(pauseLabel, titleY, "y");
			
			// 对按钮进行布局
			var stillButtonWidth:Number = Number(retolder.getProperty(stillButton, "width"));
			var stillButtonHeight:Number = Number(retolder.getProperty(stillButton, "height"));
			
			var gapY:Number = 30;
			
			var stillButtonX:Number = (width - stillButtonWidth) * 0.5;
			var stillButtonY:Number = titleY + titleHeight + gapY;
			
			retolder.setProperty(stillButton, stillButtonX, "x");
			retolder.setProperty(stillButton, stillButtonY, "y");
			
			var destructionButtonButtonWidth:Number =
				Number(retolder.getProperty(destructionButton, "width"));
			
			var destructionButtonButtonHeight:Number = 
				Number(retolder.getProperty(destructionButton, "height"));
			
			var destructionButtonX:Number = (width - destructionButtonButtonWidth) * 0.5;
			var destructionButtonY:Number = stillButtonY + stillButtonHeight + gapY;
			
			retolder.setProperty(destructionButton, destructionButtonX, "x");
			retolder.setProperty(destructionButton, destructionButtonY, "y");
			
		}
		
		
	}
}