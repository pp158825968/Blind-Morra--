package prisms.views.tenteis.uis
{
	import prisms.mediators.Arrester;

	/**
	 * 通关幕
	 * <br/>
	 * 爆机的时候 显示这一幕
	 */
	public class AllClearTent extends BaseTent
	{
		/**
		 * 通关幕
		 * <br/>
		 * 爆机的时候 显示这一幕
		 */
		public function AllClearTent(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
		}
		
		
		/**
		 * 标题标签
		 */
		private var titleLabel:Object;
		
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
		 * 初始化标签组件
		 */
		private function initLabels():void
		{
			// 初始ui组件
			
			// 需要一个文本框显示百分比
			
			var title:String = "Level All Clear ♂ Congratulation";
			
			titleLabel = retolder.getTextField(title);
			
		}
		
		/**
		 * 重新开始幕按钮
		 * <br/>
		 * 重新开始幕按钮并不直接在这里创建
		 */
		private var restartButton:Object;
		
		/**
		 * 创建按钮
		 */
		private function initButtons():void
		{
			restartButton = Arrester.buttonManager.restartButton;
			
			
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
			
			retolder.addChildToParent(titleLabel, mainContainer);
			
			retolder.addChildToParent(restartButton.mainContainer, mainContainer);
			
		}
		
		
		/**
		 * 组件布局
		 */
		override protected function layoutComponents():void
		{
			// 对标题进行布局
			var titleWidth:Number = Number(retolder.getProperty(titleLabel, "width"));
			var titleHeight:Number = Number(retolder.getProperty(titleLabel, "height"));
			
			var titleX:Number = (width - titleWidth) * 0.5;
			var titleY:Number = (height - titleHeight) * 0.5;
			
			retolder.setProperty(titleLabel, titleX, "x");
			retolder.setProperty(titleLabel, titleY, "y");
			
			// 对开始按钮进行布局
			var startButtonWidth:Number = Number(retolder.getProperty(restartButton, "width"));
			var startButtonHeight:Number = Number(retolder.getProperty(restartButton, "height"));
			
			var gapY:Number = 30;
			var startButtonX:Number = (width - startButtonWidth) * 0.5;
			var startButtonY:Number = titleY + titleHeight + gapY;
			
			retolder.setProperty(restartButton, startButtonX, "x");
			retolder.setProperty(restartButton, startButtonY, "y");
		}
		
		
		
	}
}