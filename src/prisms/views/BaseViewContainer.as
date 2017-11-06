package prisms.views
{
	import prisms.models.bases.BaseDispatchObject;
	
	/**
	 * 兼容容器对象
	 * <br/>
	 * 由于考虑要兼容LayaBox
	 * <br/>
	 * 所以不能直接使用flash原生的显示对象
	 * <br/>
	 * 该类有一个设置最终显示容器的方法
	 */
	public class BaseViewContainer extends BaseDispatchObject
	{
		/**
		 * 兼容容器对象
		 * <br/>
		 * 由于考虑要兼容LayaBox
		 * <br/>
		 * 所以不能直接使用flash原生的显示对象
		 * <br/>
		 * 该类有一个设置最终显示容器的方法
		 */
		public function BaseViewContainer()
		{
			super();
			
		}
		
		/**
		 * 总初始化
		 */ 
		override protected function inits():void
		{
			super.inits();
			
			initMainContainer();
		}
		
		
		
		/**
		 * 初始化主显示容器
		 */
		private function initMainContainer():void
		{
			// 一般情况下 所有的逻辑视图都放在_mainContainer这里显示了
			_mainContainer = retolder.getSprite();
			
		}
		
		/**
		 * @private
		 */
		private var _mainContainer:Object;

		/**
		 * 主显示对象接口
		 * <br/>
		 * 使用时 请确保该对象能被正确传递
		 */
		public function get mainContainer():Object
		{
			return _mainContainer;
		}
		
		private var _width:Number = 0;

		/**
		 * 真实宽度
		 */
		public function get width():Number
		{
			return _width;
		}

		/**
		 * @private
		 */
		public function set width(value:Number):void
		{
			_width = value;
		}

		
		private var _height:Number = 0;

		/**
		 * 真实高度
		 */
		public function get height():Number
		{
			return _height;
		}

		/**
		 * @private
		 */
		public function set height(value:Number):void
		{
			_height = value;
		}
		
		/**
		 * 请求重新布局事件
		 */
		public static const LAYOUT_REFRESH:String = "layout refresh"; 
		
		/**
		 * 请求重新布局事件
		 */
		protected function dispactLayoutEvent():void
		{
			dispatchEvent(LAYOUT_REFRESH);
		}
		
		
		
		/**
		 * x 对mainContainer.x操作
		 */
		public function get x():Number
		{
			return _mainContainer.x;
		}

		/**
		 * @private
		 */
		public function set x(value:Number):void
		{
			_mainContainer.x = value;
		}
		
		/**
		 * y 对mainContainer.y操作
		 */
		public function get y():Number
		{
			return _mainContainer.y;
		}

		/**
		 * @private
		 */
		public function set y(value:Number):void
		{
			_mainContainer.y = value;
		}
		
		/**
		 * z 对mainContainer.z操作
		 */
		public function get z():Number
		{
			return _mainContainer.z;
		}

		/**
		 * @private
		 */
		public function set z(value:Number):void
		{
			_mainContainer.z = value;
		}
		
		
		
		/**
		 * 普通角度旋转
		 */
		public function get rotation():Number
		{
			return mainContainer.rotation;
		}

		/**
		 * @private
		 */
		public function set rotation(value:Number):void
		{
			mainContainer.rotation = value;
		}

		/**
		 * 沿着x进行旋转
		 */
		public function get rotationX():Number
		{
			return mainContainer.rotationX;
		}

		/**
		 * @private
		 */
		public function set rotationX(value:Number):void
		{
			mainContainer.rotationX = value;
		}

		/**
		 * 沿着x进行旋转
		 */
		public function get rotationY():Number
		{
			return mainContainer.rotationY;
		}

		/**
		 * @private
		 */
		public function set rotationY(value:Number):void
		{
			mainContainer.rotationY = value;
		}

		/**
		 * 沿着x进行旋转
		 */
		public function get rotationZ():Number
		{
			return mainContainer.rotationZ;
		}

		/**
		 * @private
		 */
		public function set rotationZ(value:Number):void
		{
			mainContainer.rotationZ = value;
		}
		
		/**
		 * 设置主容器的交互点击范围
		 * <br/>
		 * 主要给LayaBox准备
		 */
		public function setMouseInMainContainer():void
		{
			retolder.setMouseRange(mainContainer, width, height);
		}
		
		
	}
}