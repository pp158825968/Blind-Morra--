package prisms.mediators.owns
{
	import prisms.models.bases.BaseRetoldObject;
	import prisms.views.VisualPhoto;
	
	/**
	 * 内部视图管理器
	 * <br/>
	 * 负责创建一些较为复杂的显示对象
	 */
	public class VisualManager extends BaseRetoldObject
	{
		
		/**
		 * 内部视图管理器
		 * <br/>
		 * 负责创建一些较为复杂的显示对象
		 */
		public function VisualManager()
		{
			super();
		}
		
		/**
		 * 切图器
		 * <br/>
		 * 显示系统的出拳结果 同时在“偷看”中 发挥重要作用
		 */
		public var visualPhoto:VisualPhoto;
		
		/**
		 * 创建切图器
		 */
		public function standardToVisualPhoto():VisualPhoto
		{
			if(visualPhoto) return visualPhoto;
			
			visualPhoto = new VisualPhoto();
			
			return visualPhoto;
		}
		
		
	}
}