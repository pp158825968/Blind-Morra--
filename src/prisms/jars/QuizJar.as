package prisms.jars
{
	/**
	 * 问题选项卡里面的台词的获取字段
	 */
	public class QuizJar
	{
		
		/**
		 * 问题选项卡里面的台词的获取字段
		 */
		public function QuizJar()
		{
			
		}
		
		/**
		 * 石头
		 */
		public static const ROCK:String = "rock";
		
		/**
		 * 剪刀
		 */
		public static const SCISSOR:String = "scissor"; 
		
		/**
		 * 布
		 */
		public static const PAPER:String = "paper";
		
		/**
		 * 胜
		 */
		public static const WIN:String = "win";
		
		/**
		 * 平
		 */
		public static const DRAWM:String = "drawn";
		
		/**
		 * 负
		 */
		public static const LOSE:String = "lose";
		
		/**
		 * 提问一
		 */
		public static const MORRA_QUIZ:String = "morra_quiz";
		
		/**
		 * 提问二
		 */
		public static const BETS_QUIZ:String = "bets_quiz";
		
		/**
		 * 怂恿下注的句子1
		 */
		public static const BET_ALL_IN_1:String = "bet_all_in_1";
		
		/**
		 * 玩家称呼
		 */
		public static var PLAYER_NAME:String = "player_name";
		
		/**
		 * 电脑称呼
		 */
		public static var COMPUTER_NAME:String = "computer_name";

		/**
		 * 鼓励 - 胜利提示
		 */
		public static var WIN_TIP:String = "win_tip";
		
		/**
		 * 冷静 - 打平提示
		 */
		public static var DRAWN_TIP:String = "drawn_tip";
		
		/**
		 * 嘲讽 - 失败提示
		 */
		public static var LOSE_TIP:String = "lose_tip";
		
		/**
		 * 过关提示 - 这个在结果面板上的按钮显示
		 */
		public static var LEVEL_CLEAR:String = "level_clear";
		
		/**
		 * 游戏结束提示 - 这个在结果面板上的按钮显示
		 */
		public static var LEVEL_OVER:String = "level_over";
		
		/**
		 * 继续停留在关卡中 - 这个在结果面板上的按钮显示
		 */
		public static var LEVEL_CONTINUE:String = "level_continue";
		
		/**
		 * 摇奖中
		 */
		public static var GUESSING:String = "guessing";
		
		/**
		 * 偷看提示
		 * 
		 */
		public static var PEEK_TIPS:String = "peek_tips";
		
		/**
		 * 逆转倍数提示
		 */
		public static var WIN_BETS_TIP:String = "win_best_tip";
		
		/**
		 * 后悔提示
		 * 
		 */
		public static var REPENT_TIPS:String = "repent_tips";
		
		
		/**
		 * 多语言键数组
		 */
		public static var languageKeys:Array;
		
		/**
		 * 出拳手势数组
		 */
		public static var morraSigns:Array = [ROCK, SCISSOR, PAPER];
		
		
		
		/**
		 * 初始化多语言键数组
		 */
		public static function initKeys():void
		{
			languageKeys = [
				ROCK, SCISSOR, PAPER, MORRA_QUIZ,
				BETS_QUIZ, BET_ALL_IN_1, 
				WIN, DRAWM, LOSE,
				PLAYER_NAME,COMPUTER_NAME,
				WIN_TIP,DRAWN_TIP,LOSE_TIP,
				LEVEL_OVER, LEVEL_CLEAR, LEVEL_CONTINUE,
				GUESSING,
				PEEK_TIPS
			];
		}
		
	}
}