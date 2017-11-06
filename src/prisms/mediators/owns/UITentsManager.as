package prisms.mediators.owns
{
	import prisms.models.bases.BaseRetoldObject;
	import prisms.views.tenteis.uis.AllClearTent;
	import prisms.views.tenteis.uis.BeforeLevelTent;
	import prisms.views.tenteis.uis.GameOverTent;
	import prisms.views.tenteis.uis.IntroduceTent;
	import prisms.views.tenteis.uis.PauseTent;
	import prisms.views.tenteis.uis.PrepareTent;
	import prisms.views.tenteis.uis.TitleTent;
	
	/**
	 * 负责创建各种场景
	 * <br/>
	 * 关卡场景主要有LevelManager来管理/创建
	 * <br/>
	 * 要是其他场景代码量也过大的话 也能像LevelManager这么做
	 */
	public class UITentsManager extends BaseRetoldObject
	{
		
		/**
		 * 负责创建各种场景
		 * <br/>
		 * 关卡场景主要有LevelManager来管理/创建
		 * <br/>
		 * 要是其他场景代码量也过大的话 也能像LevelManager这么做
		 */
		public function UITentsManager()
		{
			super();
		}
		
		/**
		 * 初始准备场景
		 */
		public var prepareTent:PrepareTent;
		
		/**
		 * 创建初始准备场景
		 */
		public function standardToPrepareTent():PrepareTent
		{
			if(prepareTent) return prepareTent;
			
			prepareTent = new PrepareTent();
			
			return prepareTent;
		}
		
		/**
		 * 主标题场景
		 * <br/>
		 * 主标题场景有个开始按钮 点击可以进入关卡进行游戏
		 */
		public var titleTent:TitleTent;
		
		/**
		 * 创建主标题场景
		 */
		public function standardToTitleTent():TitleTent
		{
			if(titleTent) return titleTent;
			
			titleTent = new TitleTent();
			
			return titleTent;
		}
		
		/**
		 * 关卡预备幕
		 * <br/>
		 * 关卡预备幕要显示相关的关卡加载信息
		 */
		public var beforeLevelTent:BeforeLevelTent;
		
		/**
		 * 创建关卡预备幕
		 * <br/>
		 */
		public function standardToBeforeLevelTent():BeforeLevelTent
		{
			if(beforeLevelTent) return beforeLevelTent;
			
			beforeLevelTent = new BeforeLevelTent();
			
			return beforeLevelTent;
		}
		
		/**
		 * 游戏结束幕
		 */
		public var gameOverTent:GameOverTent;
		
		/**
		 * 创建游戏结束幕
		 */
		public function standardToGameOverTent():GameOverTent
		{
			if(gameOverTent) return gameOverTent;
			
			gameOverTent = new GameOverTent();
			
			return gameOverTent;
		}
		
		/**
		 * 游戏通过画面
		 */
		public var allClearTent:AllClearTent;
		
		
		/**
		 * 创建游戏结束幕
		 */
		public function standardToAllClearTent():AllClearTent
		{
			if(allClearTent) return allClearTent;
			
			allClearTent = new AllClearTent();
			
			return allClearTent;
		}
		
		
		/**
		 * 游戏介绍幕
		 */
		public var introduceTent:IntroduceTent;
		
		/**
		 * 创建游戏介绍幕
		 */
		public function standardToIntroduceTent():IntroduceTent
		{
			if(introduceTent) return introduceTent;
			
			introduceTent = new IntroduceTent();
			
			return introduceTent;
		}
		
		/**
		 * 游戏暂停幕
		 */
		public var pauseTent:PauseTent;
		
		/**
		 * 创建游戏暂停幕
		 */
		public function standardToPauseTent():PauseTent
		{
			if(pauseTent) return pauseTent;
			
			pauseTent = new PauseTent();
			
			return pauseTent;
		}
		
		
	}
}