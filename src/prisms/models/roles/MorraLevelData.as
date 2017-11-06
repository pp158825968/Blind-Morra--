package prisms.models.roles
{
	import prisms.jars.QuizJar;
	import prisms.models.LevelBetData;
	import prisms.models.bases.BaseRetoldObject;

	/**
	 * 猜拳时需要在关卡里面使用的数据记录对象
	 */
	public class MorraLevelData extends BaseRetoldObject
	{
		
		/**
		 * 猜拳时需要使用的数据记录对象
		 */
		public function MorraLevelData()
		{
			inits();
		}
		
		/**
		 * 总初始化
		 */
		private function inits():void
		{
			// 说到底还是得准备关卡数据
			// 起码玩家要赢多少 才能过关
		}
		
		/**
		 * 玩家选择的出招
		 */
		public var playerSign:String;
		
		/**
		 * 电脑/系统做出的出招
		 */
		public var systemSign:String;
		
		/**
		 * 猜拳胜利时玩家的获利倍数
		 * <br/>
		 * 一般是乘以2
		 */
		public var winValue:int = 2;
		
		
		/**
		 * 逆转取胜后的奖励倍数
		 */
//		public var turnAroundValue:int = 1;
		
		/**
		 * 记录玩家的下注数量
		 */
		public var playerBetScore:int;
		
		/**
		 * 让系统进行猜拳计算
		 */
		public function systemMorra():void
		{
			systemSign = getRomdanMorra();
		}
		
		/**
		 * 获取随机猜拳结果
		 */
		private function getRomdanMorra():String
		{
			var index:int = retolder.parseToInt(QuizJar.morraSigns.length * retolder.random());
			
			return QuizJar.morraSigns[index];
		}		
		
		/**
		 * 判断胜负 判断玩家是否获胜
		 * <br/>
		 */
		public function getPlayerMorraResult():String
		{
			var result:String;
			
			if(playerSign == systemSign)
			{
				result = QuizJar.DRAWM;
			}
			else
			{
				if(playerSign == QuizJar.PAPER)
				{
					result = systemSign == QuizJar.ROCK ? QuizJar.WIN : QuizJar.LOSE;
				}
				else if(playerSign == QuizJar.SCISSOR)
				{
					result = systemSign == QuizJar.PAPER ? QuizJar.WIN : QuizJar.LOSE;
				}
				else if(playerSign == QuizJar.ROCK)
				{
					result = systemSign == QuizJar.SCISSOR ? QuizJar.WIN : QuizJar.LOSE;
				}
				else
				{
					// 跑到这里的话 肯定是要报错的
					trace("Error -> MorraLevelData#getPlayerMorraResult");
				}
			}
			
			return result;
		}
		
		/**
		 * 根据胜负关系结算分数
		 */
		public function getChargeScoreByResult(result:String):int
		{
			var targetScore:int = 0;
			
			if(result == QuizJar.WIN)
			{
				targetScore = playerBetScore * winValue;
			}
			else if(result == QuizJar.DRAWM)
			{
				targetScore = playerBetScore;
			}
			
			return targetScore;
		}
		
		/**
		 * 重设数据
		 */
		public function resetData():void
		{
			playerSign = null;
			systemSign = null;
			_isWillGuessd = false;
			winValue = 2;
		}
		
		private var _isWillGuessd:Boolean = false;

		/**
		 * 是否在揭开谜底之前 是否允许让玩家尝试偷看
		 */
		public function get isWillGuessd():Boolean
		{
			return _isWillGuessd;
		}

		/**
		 * @private
		 */
		public function set isWillGuessd(value:Boolean):void
		{
			_isWillGuessd = value;
		}
		
		
	}
}