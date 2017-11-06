package prisms.views.tenteis.uis
{
	import prisms.jars.UIKeysJar;
	import prisms.mediators.Arrester;

	/**
	 * 介绍幕
	 * <br/>
	 * 主要说明一下游戏的操作
	 */
	public class IntroduceTent extends BaseTent
	{
		/**
		 * 介绍幕
		 * <br/>
		 * 主要说明一下游戏的操作
		 */
		public function IntroduceTent(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
		}
		
		
		/**
		 * 标题标签
		 */
		private var introduceLabel:Object;
		
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
		 * 初始化一个背景
		 */
		override protected function initBg():void
		{
			super.initBg();
			
			retolder.setProperty(bgRect, 0x667788, "color");
		}
		
		/**
		 * 初始化标签组件
		 */
		private function initLabels():void
		{
			// 介绍内容
			var tempIntroduceText:String = Arrester.getLanguageText(UIKeysJar.INTRODUCE);
			
			introduceLabel = retolder.getTextField(tempIntroduceText);
			
		}
		
		/**
		 * 重新开始幕按钮
		 * <br/>
		 * 重新开始幕按钮并不直接在这里创建
		 */
		private var knowButton:Object;
		
		/**
		 * 创建按钮
		 */
		private function initButtons():void
		{
			knowButton = Arrester.buttonManager.knowButton;
			
			
		}
		
		/**
		 * 初始化布局
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
			
			retolder.addChildToParent(introduceLabel, mainContainer);
			
			retolder.addChildToParent(knowButton.mainContainer, mainContainer);
			
		}
		
		
		/**
		 * 组件布局
		 */
		override protected function layoutComponents():void
		{
			// 对标题进行布局
			var titleWidth:Number = Number(retolder.getProperty(introduceLabel, "width"));
			var titleHeight:Number = Number(retolder.getProperty(introduceLabel, "height"));
			
			var titleX:Number = (width - titleWidth) * 0.5;
			var titleY:Number = (height - titleHeight) * 0.5;
			
			retolder.setProperty(introduceLabel, titleX, "x");
			retolder.setProperty(introduceLabel, titleY, "y");
			
			// 对开始按钮进行布局
			var startButtonWidth:Number = Number(retolder.getProperty(knowButton, "width"));
			var startButtonHeight:Number = Number(retolder.getProperty(knowButton, "height"));
			
			var gapY:Number = 30;
			var startButtonX:Number = (width - startButtonWidth) * 0.5;
			var startButtonY:Number = titleY + titleHeight + gapY;
			
			retolder.setProperty(knowButton, startButtonX, "x");
			retolder.setProperty(knowButton, startButtonY, "y");
		}
		
		
	}
}