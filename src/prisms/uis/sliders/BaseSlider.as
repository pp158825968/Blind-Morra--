package prisms.uis.sliders
{
	import prisms.views.BaseViewContainer;
	
	/**
	 * 进度条
	 * <br/>
	 * 同样也能在Flash Laya下使用
	 */
	public class BaseSlider extends BaseViewContainer
	{
		
		/**
		 * 进度条
		 * <br/>
		 * 同样也能在Flash Laya下使用
		 */
		public function BaseSlider()
		{
			super();
			
			// 暂时还没用的上
			inits();
		}
		
		/**
		 * 总初始化
		 */
		private function inits():void
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
			// initRects();
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
		
		

		
		
	}
}