package prisms.views.tenteis.uis
{
	import prisms.mediators.Arrester;

	/**
	 * 游戏结束场景
	 * <br/>
	 * 有一个Deep Dark Fantasy的标签以及一个回到主标题场景的按钮
	 */
	public class GameOverTent extends BaseTent
	{
		
		/**
		 * 游戏结束场景
		 * <br/>
		 * 有一个Deep Dark Fantasy的标签以及一个回到主标题场景的按钮
		 */
		public function GameOverTent(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
		}
		
		
		/**
		 * 游戏结束标题标签
		 */
		private var gamOverLabel:Object;
		
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
			
			var title:String = "Deep Dark Fantasy";
			
			gamOverLabel = retolder.getTextField(title);
			
		}
		
		/**
		 * 结束按钮
		 * <br/>
		 * 结束按钮并不直接在这里创建
		 */
		private var gameOverButton:Object;
		
		/**
		 * 创建按钮
		 */
		private function initButtons():void
		{
			gameOverButton = Arrester.buttonManager.overButton; 
			
			
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
			
			retolder.addChildToParent(gamOverLabel, mainContainer);
			
			retolder.addChildToParent(gameOverButton.mainContainer, mainContainer);
			
		}
		
		
		/**
		 * 组件布局
		 */
		override protected function layoutComponents():void
		{
			// 对文本标签进行布局
			var titleWidth:Number = Number(retolder.getProperty(gamOverLabel, "width"));
			var titleHeight:Number = Number(retolder.getProperty(gamOverLabel, "height"));
			
			var titleX:Number = (width - titleWidth) * 0.5;
			var titleY:Number = (height - titleHeight) * 0.5;
			
			retolder.setProperty(gamOverLabel, titleX, "x");
			retolder.setProperty(gamOverLabel, titleY, "y");
			
			// 对结束按钮进行布局
			var startButtonWidth:Number = Number(retolder.getProperty(gameOverButton, "width"));
			var startButtonHeight:Number = Number(retolder.getProperty(gameOverButton, "height"));
			
			var gapY:Number = 30;
			var startButtonX:Number = (width - startButtonWidth) * 0.5;
			var startButtonY:Number = titleY + titleHeight + gapY;
			
			retolder.setProperty(gameOverButton, startButtonX, "x");
			retolder.setProperty(gameOverButton, startButtonY, "y");
		}
		
	}
}