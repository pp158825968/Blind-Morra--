package prisms.uis.buttons
{
	import prisms.views.BaseViewContainer;
	
	/**
	 * 按钮基类
	 * <br/>
	 * 样式比较单调 只有一个背景和标签
	 */
	public class BaseButton extends BaseViewContainer
	{
		public function BaseButton(buttonText:String = "Label", color:uint = 0xE30520)
		{
			_labelText = buttonText;
			
			_backgroundColor = color;
			
			super();
			
		}
		
		/**
		 * 总初始化
		 */
		override protected function inits():void
		{
			super.inits();
			
			initComponents();
			
			initBaseSetting();
			
			initLayoutComponents();
			
			initListeners();
			
			addComponentsToStage();
		}
		
		/**
		 * 一些按钮相关的属性设置
		 */
		private function initBaseSetting():void
		{
			setMouseInMainContainer();
			
			retolder.setProperty(mainContainer, true, "buttonMode");
			
			retolder.setProperty(mainContainer, false, "mouseChildren");
		}		
		
		/**
		 * 初始化组件
		 */
		protected function initComponents():void
		{
			initBg();
			
			initLabels();
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
				65, 25, _backgroundColor);
			
			
		}
		
		/**
		 * 标题标签
		 */
		private var label:Object;
		
		private var _labelText:String;
		
		/**
		 * 初始化标签组件
		 */
		private function initLabels():void
		{
			// 初始ui组件
			
			label = retolder.getTextField(_labelText);
			
		}
		
		/**
		 * 初始化组建的基本布局
		 */
		protected function initLayoutComponents():void
		{
			layoutComponents();
		}
		
		/**
		 * 初始化侦听器
		 */
		protected function initListeners():void
		{
			// 改进点击事件
			// 转发对象
			
			// 从这里开始吧
			// 做到这里 2017年11月4日17:18:36
			retolder.addEventListener(mainContainer,
				retolder.click, onClickToChange, this);
			
			// mainContainer.on(retolder.click, this, onClickToChange);
			
			// layabox还得注意点击作用域的问题
//			mainContainer.width = width;
//			mainContainer.height = height;
			
		}
		
		/**
		 * 转发点击事件
		 */
		private function onClickToChange(event:Object):void
		{
//			trace("this " + this);
//			trace("this.data " + this.data);
			dispatchEvent(retolder.click, this);
		}
		
		/**
		 * 把组件放到舞台上
		 */
		protected function addComponentsToStage():void
		{
			retolder.addChildToParent(bgRect, mainContainer);
			
			retolder.addChildToParent(label, mainContainer);
			
		}
		
		/**
		 * 组件布局
		 */
		protected function layoutComponents():void
		{
			var labelWidth:Number = Number(retolder.getProperty(label, "width"));
			var labelHeight:Number = Number(retolder.getProperty(label, "height"));
			
			var labelX:Number = (width - labelWidth) * 0.5;
			var labelY:Number = (height - labelHeight) * 0.5;
			
			retolder.setProperty(label, labelX, "x");
			retolder.setProperty(label, labelY, "y");
			
		}
		
		/**
		 * 设置组件显示的宽高范围
		 */
		public function setSize(w:Number = -1, h:Number = -1):void
		{
			if(w > -1) retolder.setProperty(bgRect, w, "width");
			if(h > -1) retolder.setProperty(bgRect, h, "height");
			
			
			layoutComponents();
		}
		
		/**
		 * 标签文本
		 */
		public function get labelText():String
		{
			return _labelText;
		}
		
		/**
		 * @private
		 */
		public function set labelText(value:String):void
		{
			_labelText = value;
			
			
//			trace("before width " + label.width);
			
			retolder.setTextInField(label, _labelText);
			
//			trace("after width " + label.width);
			
			// 到这里有问题了
			layoutComponents();
		}
		
		private var _backgroundColor:uint;

		/**
		 * 按钮背景颜色
		 */
		public function get backgroundColor():uint
		{
			return _backgroundColor;
		}

		/**
		 * @private
		 */
		public function set backgroundColor(value:uint):void
		{
			_backgroundColor = value;
			
			retolder.setProperty(bgRect, _backgroundColor, "color");
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
		
		private var _data:Object = {};

		/**
		 * 按钮可以携带一些数据对象
		 */
		public function get data():Object
		{
			return _data;
		}

		/**
		 * @private
		 */
		public function set data(value:Object):void
		{
			_data = value;
		}
		
		
	} // class over
	
} // package over