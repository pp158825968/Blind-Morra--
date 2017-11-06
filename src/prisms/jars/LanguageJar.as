package prisms.jars
{
	/**
	 * 多语言关联字段
	 * <br/>
	 * 主要还是用于按钮的创建
	 */
	public class LanguageJar
	{
		
		/**
		 * 多语言关联字段
		 * <br/>
		 * 主要还是用于按钮的创建
		 */
		public function LanguageJar()
		{
			
		}
		
		
		/**
		 * 开始
		 */
		public static const START:String = "start";
		
		/**
		 * 结束
		 */
		public static const OVER:String = "over";
		
		/**
		 * 重新开始
		 */
		public static const RESTART:String = "restart";
		
		/**
		 * 知道了
		 */
		public static const KNOW:String = "know";
		
		/**
		 * 暂停
		 */
		public static const PAUSE:String = "pause";
		
		/**
		 * 继续游戏
		 */
		public static const STILL:String = "still";
		
		/**
		 * 继续游戏
		 */
		public static const DESTRUCTION:String = "destruction";
		
		/**
		 * 同意按钮
		 */
		public static const AGREE:String = "agree";
		
		/**
		 * 充值按钮
		 */
		public static const PRICELESS:String = "priceless";
		
		/**
		 * 拒绝充值按钮
		 */
		public static const CHEAP:String = "cheap";
		
		/**
		 * 坚信按钮
		 */
		public static const BELIEVE:String = "believe";
		
		/**
		 * 后悔按钮
		 */
		public static const REPENT:String = "repent";
		
		/**
		 * 多语言键数组
		 */
		public static var languageKeys:Array;
		
		
		/**
		 * 初始化多语言键数组
		 */
		public static function initKeys():void
		{
			languageKeys = [
				START, OVER, RESTART, KNOW,
				PAUSE, STILL, DESTRUCTION, AGREE,
				PRICELESS, CHEAP,
				BELIEVE, REPENT
			];
		}
		
		
	}
}