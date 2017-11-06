package prisms.models.roles
{
	/**
	 * 游戏中的角色数据
	 */
	public class RoleData
	{
		
		/**
		 * 游戏中的角色数据
		 */
		public function RoleData()
		{
			// 目前就只有玩家而言
		}
		
		/**
		 * 分数
		 */
		public var score:int = 1000;
		
		/**
		 * 当前在关卡之中获取到的分数
		 */
		public var currentScore:int = 0;
		
		/**
		 * 剩余再挑战次数
		 */
		public var betChances:int = 0;
		
		/**
		 * all-in挑战次数
		 */
		public var allInChances:int = 0;
		
		/**
		 * 下注扣分前的分数
		 */
		public var beforeBetScore:int = 0;
		
		/**
		 * 次数复位
		 */
		public function resetChances():void
		{
			betChances = 1;
			allInChances = 0;
			currentScore = 0;
			beforeBetScore = 0;
		}
		
		/**
		 * 重置分数
		 */
		public function resetScore():void
		{
			score = 1000;
		}
		
		
		
	}
}