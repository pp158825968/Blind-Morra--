package prisms.views.tenteis.uis
{
	import prisms.jars.UIKeysJar;
	import prisms.mediators.Arrester;
	import prisms.views.BaseViewContainer;
	
	/**
	 * 初始准备场景
	 * <br/>
	 * 初始场景在初始数据加载完成之后 就自动不出现了
	 */
	public class PrepareTent extends BaseTent
	{
		/**
		 * 初始准备场景
		 */
		public function PrepareTent(bgColor:uint = 0x886677)
		{
			
			super(bgColor);
			
		}
		
		/**
		 * 进度标签
		 */
		private var progressLabel:Object;
		
		/**
		 * 初始化组件
		 */
		override protected function initComponents():void
		{
			super.initComponents();
			
			initLabels();
			
		}
		
		/**
		 * 初始化标签组件
		 */
		private function initLabels():void
		{
			// 初始ui组件
			
			// 需要一个文本框显示百分比
			
			var progress:String = "0";// Arrester.getLanguageText("0");
			
			// trace("progress " + progress);
			
			progressLabel = retolder.getTextField(progress);
			
			// trace("progressLabel " + progressLabel);
			
		}
		
		/**
		 * 把组件放到舞台上
		 * 
		 */
		override protected function addComponentsToStage():void
		{
			super.addComponentsToStage();
			
//			trace("addComponentsToStage");
//			trace("label " + progressLabel);
//			trace("mainContainer " + mainContainer);
			retolder.addChildToParent(progressLabel, mainContainer);
		}
		
		

	}
}