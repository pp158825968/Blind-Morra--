package prisms.mediators.logics
{
	import prisms.jars.QuizJar;
	import prisms.mediators.Arrester;
	import prisms.models.LevelBetData;
	import prisms.models.roles.RoleData;
	import prisms.uis.dialogs.RoleDialog;
	import prisms.views.tenteis.levels.LevelTend;
	import prisms.views.tenteis.uis.BeforeLevelTent;
	

	/**
	 * 关卡管理类
	 */
	public class LevelManager
	{
		/**
		 * 关卡管理类
		 */
		public function LevelManager()
		{
			// Manager类们主要负责创建 或者说 初始化的工作
			initLevelTentStyle();
		}
		
		/**
		 * 当前关卡
		 */
		public var currentLevel:int = 0;
		
		/**
		 * 关卡视图实例
		 */
		public var levelTend:LevelTend;
		
		/**
		 * 每关的下注数据以及过关条件数据
		 */
		public var levelScoreData:LevelBetData;
		
		
		/**
		 * 创建关卡实例
		 * <br/>
		 * 同时玩家头像框被创建的同时 也会放到关卡幕中显示
		 */
		public function standardToLevelTend():LevelTend
		{
			if(levelTend) return levelTend;
			
			levelScoreData = new LevelBetData();
			
			// trace("levelScoreData.totalLevelCount " + levelScoreData.totalLevelCount);
			
			levelTend = new LevelTend();
			
			levelTend.gameOverHandler = onGameOver;
			
			levelTend.levelClearHandler = onLevelClear;
			
			levelTend.pauseHandler = onPaused;
			
			levelTend.stillHandler = onStill;
			
			// 创建关卡需要的组件
			playerData = new RoleData();
			
			Arrester.quizManager.standardToMorraQuiz();
			
			Arrester.quizManager.standardToFactQuiz();
			
			Arrester.quizManager.standardToBetsQuiz();
			
			Arrester.quizManager.standardToResultQuiz();
			
			Arrester.quizManager.standardToGuessQuiz();
			
			Arrester.dialogManager.standardToPlayerDialog();
			
			levelTend.injectToLevel({playerData: playerData, 
				playerBar: Arrester.dialogManager.playerDialog, 
				morra: Arrester.quizManager.morraQuiz,
				fact:Arrester.quizManager.factQuiz,
				bet:Arrester.quizManager.betsQuiz,
				guess:Arrester.quizManager.guessQuiz,
				result: Arrester.quizManager.resultQuiz
				});
			
			return levelTend;
			
		}
		
		/**
		 * 暂停游戏
		 */
		private function onPaused():void
		{
			Arrester.uiTentManager.standardToPauseTent();
			
			Arrester.retolder.addChildToParent(
				Arrester.uiTentManager.pauseTent.mainContainer, Arrester.stage);
			
		}
		
		/**
		 * 继续游戏
		 */
		private function onStill():void
		{
			Arrester.retolder.removeChildToParent(
				Arrester.uiTentManager.pauseTent.mainContainer);
			
			Arrester.retolder.removeChildToParent(
				Arrester.uiTentManager.introduceTent.mainContainer);
		}
		
		
		/**
		 * 处理游戏结束的函数
		 */
		private function onGameOver():void
		{
			Arrester.levelManager.levelTend.playerData.resetScore();
			
			Arrester.retolder.removeChildToParent(Arrester.levelManager.levelTend.mainContainer);
			// 创建游戏结束幕
			Arrester.uiTentManager.standardToGameOverTent();
			
			Arrester.retolder.addChildToParent(
				Arrester.uiTentManager.gameOverTent.mainContainer,
				Arrester.stage);
			
			// 播放深邃黑暗幻想
//			Arrester.roleManager.playRoleSound(levelTend.playerOne.roleData.dead_sound_id);
			
		}
		
		/**
		 * 检测关卡是否结束/或者爆机
		 */
		private function onLevelClear():void
		{
			var nextLevel:int = Arrester.levelManager.currentLevel + 1;
			
			// 域的问题 显然 onLevelClear被直接当成是LevelTent里面的函数l 
//			trace("this # isLevelClear " + Object(this).isLevelClear);
			
			var totalLevel:int = Arrester.levelManager.levelScoreData.totalLevelCount;
			
			if(nextLevel > totalLevel)
			{
				Arrester.levelManager.levelAllClear();
			}
			else
			{
				Arrester.levelManager.gotoTheLevel(nextLevel);
			}
			
		}
		
		/**
		 * 全部关卡结束 显示通过画面
		 */
		public function levelAllClear():void
		{
			// trace("in levelAllClear ");
			Arrester.retolder.removeChildToParent(levelTend.mainContainer);
			
			// 创建游戏结束幕
			Arrester.uiTentManager.standardToAllClearTent();
			
			Arrester.retolder.addChildToParent(
				Arrester.uiTentManager.allClearTent.mainContainer, Arrester.stage);
		}
		
		
		/**
		 * 关卡预备幕
		 */
		private var beforeLevelTent:BeforeLevelTent;
		
		/**
		 * 当前玩家数据 里面有分数之类的
		 */
		private var playerData:RoleData;
		
		/**
		 * 载入指定的关卡数据
		 * <br/>
		 * 并且进入到闯关的过程当中
		 */
		public function gotoTheLevel(level:int):void
		{
			currentLevel = level;
			
			// 显示预备幕
			beforeLevelTent = Arrester.uiTentManager.standardToBeforeLevelTent();
			
			beforeLevelTent.currentLevel = currentLevel;
			
			Arrester.retolder.removeChildToParent(
				Arrester.uiTentManager.introduceTent.mainContainer);
			
			Arrester.retolder.addChildToParent(beforeLevelTent.mainContainer, Arrester.stage);
			
			// 加载关卡数据
			// Arrester.nouManager.gameData.getGridsInLevel(currentLevel);
			
			// 开启关卡
			beforeLevelTent.stayALittle(function():void
			{
				var levelStyleObject:Object = findStyleObject(currentLevel);
				
				levelTend.backgroundColor = levelStyleObject ?
					levelStyleObject.color : levelTend.backgroundColor;
				
					Arrester.retolder.removeChildToParent(
					Arrester.uiTentManager.beforeLevelTent.mainContainer);
				
				Arrester.retolder.addChildToParent(levelTend.mainContainer, Arrester.stage);
				
				Arrester.dialogManager.playerDialog.levelLabelText = "Lv." + currentLevel;
				
				levelTend.playerData.resetChances();
				
				levelTend.currentBetData = getCurrentLevelBetData();
				
				levelTend.start();
			});
			
		}
		
		/**
		 * 获取当前关卡的下注数据
		 */
		public function getCurrentLevelBetData():Object
		{
			return levelScoreData.findLevelBetData(currentLevel);
		}
		
		/**
		 * 存放关卡背景的数组
		 */
		private var styleObjects:Array;
		
		/**
		 * 初始化关卡背景样式
		 */
		private function initLevelTentStyle():void
		{
			styleObjects = [
				{level:1, color:0xEEFFDD},
				{level:2, color:0xDDEEFF},
				{level:3, color:0xFFEEDD},
				{level:4, color:0xEFEDFD},
				{level:5, color:0xEEDFFD},
			];
		}
		
		/**
		 * 找到对应的样式数据
		 */
		protected function findStyleObject(level:int):Object
		{
			var targetObject:Object
			
			for each (var styleObject:Object in styleObjects) 
			{
				if(styleObject.level == level)
				{
					targetObject = styleObject;
					break;
				}
			}
			
			
			return targetObject;
		}
		
	} // class over
	
} // pacakge over