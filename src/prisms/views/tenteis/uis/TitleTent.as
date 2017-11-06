package prisms.views.tenteis.uis
{
	import prisms.mediators.Arrester;
	import prisms.views.BaseViewContainer;
	
	/**
	 * 主标题场景
	 */
	public class TitleTent extends BaseTent
	{
		/**
		 * 主标题场景
		 */
		public function TitleTent(bgColor:uint = 0x886677)
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
			
			var title:String = "蒙蔽双眼的猜拳" + "\n" + "\n" + 
				retolder.versionName +
				"\n" + "\n"+ "作者: pp158825968";
			
			titleLabel = retolder.getTextField(title);
			
		}
		
		/**
		 * 开始按钮
		 * <br/>
		 * 开始按钮并不直接在这里创建
		 */
		private var startButton:Object;
		
		/**
		 * 创建按钮
		 */
		private function initButtons():void
		{
			startButton = Arrester.buttonManager.startButton;
			
			
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
			
			retolder.addChildToParent(startButton.mainContainer, mainContainer);
			
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
			var startButtonWidth:Number = Number(retolder.getProperty(startButton, "width"));
			var startButtonHeight:Number = Number(retolder.getProperty(startButton, "height"));
			
			var gapY:Number = 30;
			var startButtonX:Number = (width - startButtonWidth) * 0.5;
			var startButtonY:Number = titleY + titleHeight + gapY;
			
			retolder.setProperty(startButton, startButtonX, "x");
			retolder.setProperty(startButton, startButtonY, "y");
		}
		
		
	}
}