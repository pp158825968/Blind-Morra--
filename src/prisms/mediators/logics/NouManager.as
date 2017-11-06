package prisms.mediators.logics
{
	import prisms.mediators.Arrester;
	import prisms.views.BaseViewContainer;

	/**
	 * 本程序主要逻辑部分的支持程序
	 */
	public class NouManager
	{
		/**
		 * 本程序主要逻辑部分的支持程序
		 */
		public function NouManager()
		{
			initGameContainer();
		}
		
		/**
		 * 运行！
		 */
		public function runToNou():void
		{
			initComponents();
			
			initLayoutComponents();
			
			initListener();
			
			addComponentsToSatge();
		}
		
		
		/**
		 * 初始化组件
		 */
		private function initComponents():void
		{
			
		}
		
		/**
		 * 初始化游戏容器
		 */
		private function initGameContainer():void
		{
			gameContainer = new BaseViewContainer();
			
		}
		
		/**
		 * 初始化组建的基本布局
		 */
		private function initLayoutComponents():void
		{
			
		}
		
		/**
		 * 初始化侦听器
		 */
		private function initListener():void
		{
			Arrester.xavi.listenToXAVI();
		}
		
		/**
		 * 把组件放到舞台上
		 */
		private function addComponentsToSatge():void
		{
			
		}
		
		/**
		 * 设置组件显示的宽高范围
		 */
		public function setSize():void
		{
			
		}
		
		/**
		 * 组件布局
		 */
		public function layoutComponents():void
		{
			
		}
		
		private var _gameXML:XML;

		/**
		 * 游戏加载进来的xml设置数据
		 */
		public function get gameXML():XML
		{
			return _gameXML;
		}

		/**
		 * @private
		 */
		public function set gameXML(value:XML):void
		{
			_gameXML = value;
			
			_gameData.originalXML = _gameXML;
		}

		
		/**
		 * 整个游戏的容器
		 * <br/>
		 * 单独一个接口放出去做这个
		 * <br/>
		 * 做到这里
		 */
		public var gameContainer:BaseViewContainer;
		
		private var _gameData:Object;

		/**
		 * 游戏数据查询类
		 */
		public function get gameData():Object
		{
			return _gameData;
		}

		/**
		 * @private
		 */
		public function set gameData(value:Object):void
		{
			_gameData = value;
		}

		private var _stage:Object;

		/**
		 * 传入舞台引用
		 * <br/>
		 * 确保游戏容器能准确的 早早的放到舞台上
		 */
		public function get stage():Object
		{
			return _stage;
		}

		/**
		 * @private
		 */
		public function set stage(value:Object):void
		{
			_stage = value;
			
			Arrester.retolder.addChildToParent(gameContainer.mainContainer, _stage);
		}
		
				
		
	}
}