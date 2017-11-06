package prisms.views.quizes
{
	import prisms.mediators.Arrester;
	import prisms.views.tenteis.uis.BaseTent;
	
	/**
	 * 单个选项卡
	 * <br/>
	 * 每个选项卡要做出一次选择
	 */
	public class BaseQuiz extends BaseTent
	{
		
		/**
		 * 单个选项卡
		 * <br/>
		 * 每个选项卡要做出一次选择
		 */
		public function BaseQuiz(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
		}
		
		/**
		 * 初始化一个背景
		 * <br/>
		 * 覆盖主要为了调整宽高
		 */
		override protected function initBg():void
		{
			bgRect = retolder.getRect(
				450, 185, backgroundColor);
			
		}
		
		/**
		 * 玩家已选择了包剪锤事件
		 */
		public static const SELECTED_COMPLETE:String = "select complete";
		
		
	}
}