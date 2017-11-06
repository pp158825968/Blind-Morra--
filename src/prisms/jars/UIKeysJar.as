package prisms.jars
{
	/**
	 * 游戏界面里用的字段
	 * <br/>
	 * 靠这些字段能在game.xml拿到对应翻译的数据
	 */
	public class UIKeysJar
	{
		public function UIKeysJar()
		{
			
		}
		
		/**
		 * 进度
		 */
		public static var PROGRESS:String = "progress";
		
		/**
		 * 关卡
		 */
		public static const LEVEL:String = "level";
		
		/**
		 * 操作介绍说明
		 */
		public static const INTRODUCE:String = "introduce";
		
		/**
		 * 暂停中
		 */
		public static const PAUSING:String = "pausing";
		
		/**
		 * 玩家血量
		 */
		public static const HP:String = "hp";
		
		/**
		 * 玩家技能冷却时间
		 */
		public static const CD:String = "cd";
		
		/**
		 * 玩家分数
		 */
		public static const SCORE:String = "score";
		
		/**
		 * 玩家过关时所需要的分数
		 */
		public static const TARGET_SCORE:String = "target_score";
		
		/**
		 * 玩家当前赢得的分数
		 */
		public static const CURRENT_SCORE:String = "current_score";
		
		/**
		 * All IN！
		 * <br/>
		 * 怂恿玩家孤注一掷
		 */
		public static const ALL_IN:String = "all_in";
		
		/**
		 * 充值失败
		 */
		public static const PRICE_FAIL:String = "price_fail";
		
		/**
		 * 拒绝充值之后的嘲讽
		 */
		public static const CHEAP_CHOP:String = "cheap_chop";
		
		/**
		 * 点击"？"
		 */
		public static const QUIZ_CLICK:String = "quiz_cilck";
		
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
				PROGRESS, LEVEL, INTRODUCE, PAUSING,
				HP, CD, SCORE, ALL_IN,
				TARGET_SCORE, CURRENT_SCORE
			];
		}
		
		
	}
}