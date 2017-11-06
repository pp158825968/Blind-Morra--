package prisms.models
{
	import prisms.jars.UIKeysJar;

	/**
	 * 关卡分数数据列表
	 * <br/>
	 * 简单设定一下每关的下注数量 以及要达成过关所需要赢取的分数
	 */
	public class LevelBetData
	{
		
		/**
		 * 关卡分数数据列表
		 * <br/>
		 * 简单设定一下每关的下注数量 以及要达成过关所需要赢取的分数
		 */
		public function LevelBetData()
		{
			inits();
		}
		
		/**
		 * 记录分数设定的数据
		 */
		private var betDatas:Array;
		
		
		
		/**
		 * 初始化
		 */
		private function inits():void
		{
			betDatas = 
				[
					{level:1, limitScore: 500, bets:getBetsArray(400, 600)}, 
					{level:2, limitScore: 1000, bets:getBetsArray(800, 1200)}, 
					{level:3, limitScore: 2000, bets:getBetsArray(1000, 2400)},
					{level:4, limitScore: 4000, bets:getBetsArray(2000, 4800)},
					{level:5, limitScore: 10000, bets:getBetsArray(4000, 10000)}
				];
		}		
		
		/**
		 * 下注数量分割数组
		 */
		private function getBetsArray(...args):Array
		{
			var targetArray:Array = [];
			
			for each (var i:int in args) 
			{
				targetArray.push(i);
			}
			
			targetArray.push(UIKeysJar.ALL_IN);
			
			return targetArray;
		}
		
		/**
		 * 根据关卡系数获取指定的下注数据
		 */
		public function findLevelBetData(level:int):Object
		{
			var targetData:Object;
			
			for each (var data:Object in betDatas) 
			{
				if(data.level == level)
				{
					targetData = data;
					
					break;
				}
			}
			
			
			return targetData;
		}
		
		/**
		 * 总关卡数
		 */
		public function get totalLevelCount():int
		{
			// trace("betDatas.length " + betDatas.length);
			return betDatas.length;
		}
		
		
	}
}