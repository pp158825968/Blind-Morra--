package prisms.models.bases
{
	
	/**
	 * 带有发送事件接口的对象
	 */
	public class BaseDispatchObject extends BaseRetoldObject
	{
		
		/**
		 * 带有发送事件接口的对象
		 */
		public function BaseDispatchObject()
		{
			super();
			
			// 最开始的inits
			inits();
		}
		
	
		/**
		 * 总初始化
		 */ 
		protected function inits():void
		{
			initEventDispatcher();
			
		}
		
		/**
		 * 事件收发器
		 */
		private var dispatcher:Object;
		
		/**
		 * 初始化事件收发器
		 * <br/>
		 * 主要为了实现侦听器系列功能
		 * <br/>
		 * 这有够头大的的了
		 */
		private function initEventDispatcher():void
		{
			dispatcher = retolder.getEventDispatcher();
		}
		
		/**
		 * 发送事件
		 */
		public function dispatchEvent(typeObject:Object, data:Object = null):void
		{
			retolder.dispatchEvent(dispatcher, typeObject, data);
		}
		
		/**
		 * 添加侦听事件侦听函数
		 */
		public function addEventListener(type:String, listener:Function, caller:Object):void
		{
			retolder.addEventListener(dispatcher, type, listener, caller);
		}
		
		/**
		 * 移除侦听器
		 */
		public function removeEventListener(type:String, listener:Function, caller:Object):void
		{
			retolder.removeEventListener(dispatcher, type, listener, caller);
		}
		
	}
}