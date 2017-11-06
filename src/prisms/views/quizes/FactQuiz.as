package prisms.views.quizes
{
	import prisms.mediators.Arrester;
	import prisms.views.VisualPhoto;

	/**
	 * 实时显示猜拳状况的选项卡
	 * <br/>
	 * 这个会一直在关卡里面显示
	 */
	public class FactQuiz extends BaseQuiz
	{
		
		/**
		 * 实时显示猜拳状况的选项卡
		 * <br/>
		 * 这个会一直在关卡里面显示
		 */
		public function FactQuiz(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
		}
		
		
		/**
		 * 初始化组件
		 */
		override protected function initComponents():void
		{
			super.initComponents();
			
			initVisualPhoto();
		}
		
		

		
		/**
		 * 初始化切图器
		 */
		private function initVisualPhoto():void
		{
			_visualPhoto = Arrester.visualManager.standardToVisualPhoto();
			
		}
		
		/**
		 * 初始化组建的基本布局
		 */
		override protected function initLayoutComponents():void
		{
			layoutVisualPhoto();
			
		}
		
		/**
		 * 把组件放到舞台上
		 */
		override protected function addComponentsToStage():void
		{
			super.addComponentsToStage();
			
			retolder.addChildToParent(visualPhoto.mainContainer, mainContainer);
		}
		
		
		
		/**
		 * 对切图器进行布局
		 */
		private function layoutVisualPhoto():void
		{
			var marginX:Number = width * 0.5;
			
			var visualPhotoWidth:Number = Number(retolder.getProperty(visualPhoto, "width"));
			var visualPhotoHeight:Number = Number(retolder.getProperty(visualPhoto, "height"));
			var visualPhotoPosX:Number = marginX + (width * 0.5 - visualPhotoWidth) * 0.5;
			var visualPhotoPosY:Number = (height - visualPhotoHeight) * 0.5;
			retolder.setProperty(visualPhoto, visualPhotoPosX, "x");
			retolder.setProperty(visualPhoto, visualPhotoPosY, "y");
			
		}
		
		
		/**
		 * 玩家出拳时所选择的按钮
		 */
		private var seletcedItem:Object;
		
		/**
		 * 将选择按钮移动到指定位置
		 */
		public function moveSelectedItem(item:Object):void
		{
			seletcedItem = item;
			
			if(!seletcedItem) return;
			
			retolder.addChildToParent(seletcedItem.mainContainer, mainContainer);
			
			var nextPosition:Object = getSelectPosition(item);
			
			retolder.tweenGeen(seletcedItem, 
				{x:nextPosition.x, y:nextPosition.y});
			
		}
		
		/**
		 * 获取被选择按钮的位置
		 */
		private function getSelectPosition(item:Object):Object
		{
			var marginX:Number = 10;
			
			var itemWidth:Number = Number(retolder.getProperty(item, "width"));
			var itemHeight:Number = Number(retolder.getProperty(item, "height"));
			var posX:Number = (width * 0.5 - itemWidth) * 0.5;
			var posY:Number = (height - itemHeight) * 0.5;
			
			return {x:posX, y:posY};
		}		
		
		/**
		 * 置空面板内容
		 * <br/>
		 * 移除选择按钮等操作
		 */
		public function makeEmpty():void
		{
			if(seletcedItem)
			{
				retolder.removeChildToParent(seletcedItem);
			}
			
		}
		
		private var _visualPhoto:VisualPhoto;
		
		/**
		 * 切图器的引用
		 */
		public function get visualPhoto():VisualPhoto
		{
			return _visualPhoto;
		}
		
		
	}
}