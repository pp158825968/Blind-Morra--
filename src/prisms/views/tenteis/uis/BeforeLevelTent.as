package prisms.views.tenteis.uis
{
	import prisms.jars.LanguageJar;
	import prisms.jars.UIKeysJar;
	import prisms.mediators.Arrester;
	
	/**
	 * 关卡预备幕
	 * <br/>
	 * 关卡预备幕与正式的关卡幕之间 有个霸气的过场动画
	 * <br/>
	 * 那个动画在这里创建
	 */
	public class BeforeLevelTent extends BaseTent
	{
		
		/**
		 * 关卡预备幕
		 * <br/>
		 * 关卡预备幕与正式的关卡幕之间 有个霸气的过场动画
		 * <br/>
		 * 那个动画在这里创建
		 */
		public function BeforeLevelTent(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
		}
		
		
		
		
		/**
		 * 初始化组件
		 */
		override protected function initComponents():void
		{
			super.initComponents();
			
			initLabels();
			
		}
		
		/**
		 * 关卡标题标签
		 * <br/>
		 * 说一下是第几关
		 */
		private var levelLabel:Object;
		
		/**
		 * 进度标签
		 */
		private var progressLabel:Object;
		
		
		/**
		 * 初始化标签组件
		 */
		private function initLabels():void
		{
			// 初始ui组件
			
			// 需要一个文本框显示百分比
			
			// 关卡自己也是有东西要加载的
			
			var title:String = _currentLevel.toString();
			
			levelLabel = retolder.getTextField(title);
			
			var progress:String = "?";
			
			progressLabel = retolder.getTextField(progress);
			
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
			
			retolder.addChildToParent(levelLabel, mainContainer);
			
			retolder.addChildToParent(progressLabel, mainContainer);
		}
		
		
		/**
		 * 组件布局
		 */
		override protected function layoutComponents():void
		{
			// 对标题进行布局
			var titleGapY:Number = 20;
			
			var titleWidth:Number = Number(retolder.getProperty(levelLabel, "width"));
			var titleHeight:Number = Number(retolder.getProperty(levelLabel, "height"));
			
			var titleX:Number = (width - titleWidth) * 0.5;
			var titleY:Number = (height - titleHeight) * 0.5 - titleGapY;
			
			retolder.setProperty(levelLabel, titleX, "x");
			retolder.setProperty(levelLabel, titleY, "y");
			
			// 对开始按钮进行布局
			var progressWidth:Number = Number(retolder.getProperty(progressLabel, "width"));
			var progressHeight:Number = Number(retolder.getProperty(progressLabel, "height"));
			
			var gapY:Number = 50;
			
			var progressX:Number = (width - progressWidth) * 0.5;
			var progressY:Number = titleY + titleHeight + gapY;
			
			retolder.setProperty(progressLabel, progressX, "x");
			retolder.setProperty(progressLabel, progressY, "y");
			
			
			
			
		}
		
		private var _currentLevel:int = 0;

		/**
		 * 当前关卡
		 * <br/>
		 * 表示当前是第几关
		 */
		public function get currentLevel():int
		{
			return _currentLevel;
		}

		/**
		 * @private
		 */
		public function set currentLevel(value:int):void
		{
			_currentLevel = value;
			
			var levelText:String =
				Arrester.getLanguageText(UIKeysJar.LEVEL) + _currentLevel.toString();
			
			retolder.setTextInField(levelLabel, levelText);
			
			layoutComponents();
			
		}
		
		private var _progressText:String;

		/**
		 * 加载进度文本
		 */
		public function get progressText():String
		{
			return _progressText;
		}

		/**
		 * @private
		 */
		public function set progressText(value:String):void
		{
			_progressText = value;
			
			if(!retolder.hasParent(progressLabel))
			{
				retolder.addChildToParent(progressLabel, mainContainer);
			}
			
			retolder.setTextInField(progressLabel, _progressText);
			
			layoutComponents();
		}
		
		/**
		 * 短暂的停留一下 然后进入关卡
		 */
		public function stayALittle(complete:Function):void
		{
			completeFun = complete;
			retolder.tweenGeen(this, {time:2, onComplete: completeFun});
		}
		
		/**
		 * 进入关卡要执行函数的引用
		 * <br/>
		 * 主要为了兼容LayaBox
		 */
		private var completeFun:Function;
		
		
		
		
	}
}