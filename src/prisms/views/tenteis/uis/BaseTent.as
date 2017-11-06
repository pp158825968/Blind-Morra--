package prisms.views.tenteis.uis
{
	import prisms.mediators.Arrester;
	import prisms.views.BaseViewContainer;

	/**
	 * 简单的场景
	 * <br/>
	 * 只有一个背景
	 */
	public class BaseTent extends BaseViewContainer
	{
		
		/**
		 * 简单的场景
		 * <br/>
		 * 只有一个背景
		 */
		public function BaseTent(bgColor:uint = 0x886677)
		{
			
			// 在layaBox里面要注意super
			
			_backgroundColor = bgColor;
			
			super();
			
			
		}
		
		/**
		 * 总初始化
		 */
		override protected function inits():void
		{
			super.inits();
			
			initComponents();
			
			initLayoutComponents();
			
			initListeners();
			
			addComponentsToStage();
		}
		
		
		/**
		 * 初始化组件
		 */
		protected function initComponents():void
		{
			initBg();
			
		}
		
		/**
		 * 背景方块
		 */
		protected var bgRect:Object;
		
		/**
		 * 初始化一个背景
		 */
		protected function initBg():void
		{
			bgRect = retolder.getRect(
				Arrester.senceWidth, Arrester.senceHeight, _backgroundColor);
//			trace("bgRect " + bgRect);
//			trace("getter 失效==" + mainContainer);
		}
		
		/**
		 * 初始化组建的基本布局
		 */
		protected function initLayoutComponents():void
		{
			
		}
		
		/**
		 * 初始化侦听器
		 */
		protected function initListeners():void
		{
			
		}
		
		/**
		 * 把组件放到舞台上
		 */
		protected function addComponentsToStage():void
		{
			retolder.addChildToParent(bgRect, mainContainer);
			
		}
		
		/**
		 * 组件布局
		 */
		protected function layoutComponents():void
		{
			
		}
		
		/**
		 * 设置组件显示的宽高范围
		 */
		public function setSize(w:Number = -1, h:Number = -1):void
		{
			if(w > -1) retolder.setProperty(bgRect, w, "width");
			if(h > -1) retolder.setProperty(bgRect, h, "height");
			
			
		}
		
		override public function get height():Number
		{
			var h:Number = Number(retolder.getProperty(bgRect, "height"));
			
			return h;
		}
		
		override public function get width():Number
		{
			var w:Number = Number(retolder.getProperty(bgRect, "width"));
			
			// 咲き誇る　花のプリンセス　キュア　フローラ！
			
			return w;
		}
		
		private var _backgroundColor:uint;

		/**
		 * 背景颜色
		 */
		public function get backgroundColor():uint
		{
			if(bgRect) return retolder.parseToInt(retolder.getProperty(bgRect, "color"));
			return _backgroundColor;
		}

		/**
		 * @private
		 */
		public function set backgroundColor(value:uint):void
		{
			_backgroundColor = value;
			
			if(bgRect) retolder.setProperty(bgRect, _backgroundColor, "color");
		}
		
		
		
	}
}