package prisms.views.tenteis.levels
{
	import prisms.jars.QuizJar;
	import prisms.mediators.Arrester;
	import prisms.models.roles.MorraLevelData;
	import prisms.models.roles.RoleData;
	import prisms.uis.dialogs.RoleDialog;
	import prisms.views.BaseViewContainer;
	import prisms.views.VisualPhoto;
	import prisms.views.quizes.BaseQuiz;
	import prisms.views.quizes.BetsQuiz;
	import prisms.views.quizes.FactQuiz;
	import prisms.views.quizes.GuessQuiz;
	import prisms.views.quizes.MorraQuiz;
	import prisms.views.quizes.ResultQuiz;
	import prisms.views.tenteis.uis.BaseTent;
	
	/**
	 * 关卡视图场景
	 * <br/>
	 * 游戏主要进行的关卡逻辑 都在这里
	 * <br/>
	 * 玩家 敌人 地图 都放在这里显示
	 */
	public class LevelTend extends BaseTent
	{
		/**
		 * 关卡视图场景
		 * <br/>
		 * 游戏主要进行的关卡逻辑 都在这里
		 * <br/>
		 * 玩家 敌人 地图 都放在这里显示
		 */
		public function LevelTend(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
			
		}
		
		/**
		 * 总初始化
		 */
		override protected function inits():void
		{
			super.inits();
			
			initSettings();
			
		}
		
		/**
		 * 调整一些样式数据等操作
		 */
		private function initSettings():void
		{
			retolder.setProperty(bgRect, 0xEEE888, "color");
		}
		
		/**
		 * 猜拳数据
		 * <br/>
		 * 猜拳游戏所需要的逻辑数据
		 */
		private var _morraData:MorraLevelData;

		
		/**
		 * 初始化组件
		 */
		override protected function initComponents():void
		{
			super.initComponents();
			
			_morraData = new MorraLevelData();
		}		
		
		/**
		 * 组件布局 - 整体布局
		 * <br/>
		 */
		override protected function layoutComponents():void
		{
			// 还是得要布局啊
			var marignY:Number = 10;
			
			retolder.setProperty(playerBar, 0, "x");
			retolder.setProperty(playerBar, Arrester.senceHeight - playerBar.height, "y");
			
			var morraQuizWidth:Number = Number(retolder.getProperty(morraQuiz, "width"));
			var morraQuizHeight:Number = Number(retolder.getProperty(morraQuiz, "height"));
			
			var factQuizWidth:Number = Number(retolder.getProperty(factQuiz, "width"));
			var factQuizHeight:Number = Number(retolder.getProperty(factQuiz, "height"));
			
			var gapY:Number = (height - morraQuizHeight - factQuizHeight - playerBar.height) / 3;
			
			var morraQuizX:Number = (width - morraQuizWidth) * 0.5;
			var morraQuizY:Number = gapY;
			retolder.setProperty(morraQuiz, morraQuizX, "x");
			retolder.setProperty(morraQuiz, morraQuizY, "y");
			
			retolder.setProperty(betsQuiz, morraQuizX, "x");
			retolder.setProperty(betsQuiz, morraQuizY, "y");
			
			retolder.setProperty(guessQuiz, morraQuizX, "x");
			retolder.setProperty(guessQuiz, morraQuizY, "y");
			
			retolder.setProperty(resultQuiz, morraQuizX, "x");
			retolder.setProperty(resultQuiz, morraQuizY, "y");
			
			
			var factQuizX:Number = (width - factQuizWidth) * 0.5;
			var factQuizY:Number = morraQuizY + morraQuizHeight + gapY;
			retolder.setProperty(factQuiz, factQuizX, "x");
			retolder.setProperty(factQuiz, factQuizY, "y");
			
		}
		
		// 关卡逻辑控制部分 ↓
		
		
		/**
		 * 暂停关卡
		 */
		public function pause():void
		{
			_isPaused = true;
		}
		
		/**
		 * 继续关卡
		 */
		public function resumeLevel():void
		{
			
		}
		
		/**
		 * 开始关卡
		 */
		public function start():void
		{
			_isPaused = false;
			
			_isPlaying = true;
			
			resetDatas();
			
			updatePlayerScore();
			
			layoutComponents();
			
			addListeners();
			
			systemHadMorra();
			
			gotoTheMorra();
			
		}
		
		/**
		 * 重设数据
		 */
		private function resetDatas():void
		{
			morraData.resetData();
			
			playerData.resetChances();
		}
		
		/**
		 * 关卡一开始的时候 
		 * <br/>
		 * 系统就已经把拳给出好了
		 */
		private function systemHadMorra():void
		{
			factQuiz.visualPhoto.resetTruth();
			
			morraData.resetData();
			
			morraData.systemMorra();
			
//			trace("morraData.systemSign " + morraData.systemSign);
			
			factQuiz.visualPhoto.onlyTruth = Arrester.getLanguageText(morraData.systemSign);
			
//			trace("factQuiz.visualPhoto.onlyTruth " + factQuiz.visualPhoto.onlyTruth);
			
		}
		
		/**
		 * 注册相应的整体去
		 */
		private function addListeners():void
		{
			
			exchangeMorraListener();
			
			retolder.addEventListener(betsQuiz, 
				BaseQuiz.SELECTED_COMPLETE, onBetsQuizSelected, this);
			
			retolder.addEventListener(resultQuiz, 
				BaseQuiz.SELECTED_COMPLETE, onResultQuizSelected, this);
			
			retolder.addEventListener(guessQuiz, 
				GuessQuiz.UPDATE_VISUAL, onUpdateVisual, this);
			
			retolder.addEventListener(guessQuiz, 
				GuessQuiz.COMPLETE_VISUAL, onCompleteVisual, this);
			
			retolder.addEventListener(guessQuiz, 
				GuessQuiz.PRICELESS_CLICK, onPricelessClick, this);
			
			retolder.addEventListener(guessQuiz, 
				GuessQuiz.CHEAP_CLICK, onCheapClick, this);
			
			retolder.addEventListener(guessQuiz, 
				GuessQuiz.BELIEVE_CLICK, onBelieveClick, this);
			
			retolder.addEventListener(guessQuiz, 
				GuessQuiz.REPENT_CLICK, onRepentClick, this);
			
			retolder.addEventListener(factQuiz.visualPhoto, 
				VisualPhoto.EMBOSK, onEmbosk, this);
			
			
		}
		
		/**
		 * 切换猜拳选项卡的侦听函数
		 */
		private function exchangeMorraListener(isRepented:Boolean = false):void
		{
			if(isRepented)
			{
				morraQuiz.removeEventListener(BaseQuiz.SELECTED_COMPLETE, onMorraQuizSelected, this);
				retolder.addEventListener(morraQuiz, BaseQuiz.SELECTED_COMPLETE, onMorraRepent, this);
			}
			else
			{
				morraQuiz.removeEventListener(BaseQuiz.SELECTED_COMPLETE, onMorraRepent, this);
				retolder.addEventListener(morraQuiz, BaseQuiz.SELECTED_COMPLETE, onMorraQuizSelected, this);
				
			}
		}
		
		/**
		 * 让玩家选择出拳
		 * <br/>
		 * 玩家通过点击按钮 进行游戏
		 */
		private function gotoTheMorra():void
		{
			retolder.addChildToParent(morraQuiz.mainContainer, mainContainer);
			
		}
		
		/**
		 * 当做出包剪锤选择了之后 进入到下注的选项卡里面
		 */
		private function onMorraQuizSelected(event:Object):void
		{
			// 将点击的选项按钮 放到实时面板当中
			var item:Object = Arrester.buttonManager.findButton(_morraData.playerSign);
			
			factQuiz.moveSelectedItem(item);
			
			retolder.removeChildToParent(morraQuiz.mainContainer);
			
			gotoTheBets();
		}
		
		/**
		 * 在后悔时 当做出包剪锤选择了之后 直接进入到结果选项卡
		 */
		private function onMorraRepent(event:Object):void
		{
			// 将点击的选项按钮 放到实时面板当中
			var item:Object = Arrester.buttonManager.findButton(_morraData.playerSign);
			
			factQuiz.moveSelectedItem(item);
			
			retolder.removeChildToParent(morraQuiz.mainContainer);
			
			gotoTheResult();
		}
		
		
		/**
		 * 让玩家选择下注
		 */
		private function gotoTheBets():void
		{
			betsQuiz.updateBets();
			
			retolder.addChildToParent(betsQuiz.mainContainer, mainContainer);
			
		}
		
		/**
		 * 当做出了下注之后 去到结果面板的选项卡里面
		 */
		private function onBetsQuizSelected(event:Object):void
		{
			// 将点击的选项按钮 放到实时面板当中
			retolder.removeChildToParent(betsQuiz.mainContainer);
			
			updatePlayerScore();
			
			// 进入摇奖选项卡
			// morraData.isWillGuessd = true;
			
			gotoTheGuess();
			
		}
		
		
		/**
		 * 慢慢揭开内幕 怂恿玩家花钱提前偷看结果
		 */
		private function gotoTheGuess():void
		{
			// 提示是否进行偷看挑战
			if(morraData.isWillGuessd)
			{
				// 等待鼠标点击
				// 让切图器一闪一闪
				// 点击一下就进行随机运动
				
				// 逆转倍数玩法设计
				morraData.winValue = getTurnWinValue();
				
				guessQuiz.showPeekTips();
				
				
			}
			else
			{
				factQuiz.visualPhoto.moveTheCoat();
				
				guessQuiz.startGuess();
			}
			
			guessQuiz.x = morraQuiz.x;
			guessQuiz.y = morraQuiz.y;
			
			retolder.addChildToParent(guessQuiz.mainContainer, mainContainer);
			
			
		}
		
		/**
		 * 逆转计算倍数
		 */
		public function getTurnWinValue():int
		{
			var targetValue:int = retolder.ceil((currentBetData.limitScore / morraData.playerBetScore)
				+ 1 + 2 * retolder.random());
			
			return targetValue;
		}
		
		/**
		 * 切换索引
		 */
		private var visualIndex:int = 0;
		
		/**
		 * 切图器不断进行切换
		 * <br/>
		 * 当前只要换下文字就好了
		 */
		private function onUpdateVisual(event:Object):void
		{
			var keyName:String = QuizJar.morraSigns[visualIndex];
			visualIndex++;
			
			visualIndex = visualIndex > QuizJar.morraSigns.length ? 0 : visualIndex;
			
			var text:String = Arrester.getLanguageText(keyName);
			
			factQuiz.visualPhoto.truthText = text;
			
		}
		
		/**
		 * 切图器完成 显示谜底
		 */
		private function onCompleteVisual(event:Object):void
		{
			gotoTheResult();
		}
		
		/**
		 * 进行偷看挑战
		 * <br/>
		 * 切图器进行闪烁
		 */
		private function onPricelessClick(event:Object):void
		{
			factQuiz.visualPhoto.twinkleCoat();
			
		}
		
		/**
		 * 拒绝充值
		 * <br/>
		 * 照常显示结果
		 */
		private function onCheapClick(event:Object):void
		{
			morraData.isWillGuessd = false;
			
			gotoTheGuess();
			
		}
		
		/**
		 * 拒绝充值
		 * <br/>
		 * 照常显示结果
		 */
		private function onBelieveClick(event:Object):void
		{
			gotoTheResult();
		}
		
		/**
		 * 拒绝充值
		 * <br/>
		 * 照常显示结果
		 */
		private function onRepentClick(event:Object):void
		{
			exchangeMorraListener(true);
			
			gotoTheMorra();
			
		}
		
		/**
		 * 让玩家选择是否反悔
		 * <br/>
		 */
		private function onEmbosk(event:Object):void
		{
			guessQuiz.showRepent();
		}
		
		/**
		 * 走到结果面板
		 * <br/>
		 * 最终的选项卡
		 * <br/>
		 * 刮刮乐能看到的 不一定是最后的猜拳结果
		 */
		private function gotoTheResult():void
		{
			// 一步一步来 先完成最简单的猜拳过程
			
			retolder.removeChildToParent(guessQuiz.mainContainer);
			
			// 结算分数
			var result:String = morraData.getPlayerMorraResult();
			
			var resultScore:int = morraData.getChargeScoreByResult(result);
			
			// trace("resultScore " + resultScore);
			
			playerData.score += resultScore;
			
			playerData.currentScore = retolder.max(playerData.score - playerData.beforeBetScore, 0);
			
			updatePlayerScore();
			
			resultQuiz.result = result;
			
			retolder.addChildToParent(resultQuiz.mainContainer, mainContainer);
			
			// 显示谜底
			factQuiz.visualPhoto.showTruth(!morraData.isWillGuessd);
			
			exchangeMorraListener();
		}
		
		/**
		 * 在结果面板那里点了按钮之后
		 * <br/>
		 * 分数够就进入下一关 没输光就进行最后一把
		 * <br/>
		 * 输光就DeepDarkFantansy
		 */
		private function onResultQuizSelected(event:Object):void
		{
			if(isLevelClear)
			{
				stop();
				
				levelClearHandler();
			}
			else if(isGameOver)
			{
				stop();
				
				gameOverHandler();
			}
			else
			{
				// 继续猜拳
				// 终极挑战
				
				systemHadMorra();
				
				gotoTheMorra();
			}
			
		}
		
		/**
		 * 检测关卡是否结束
		 */
		public function get isLevelClear():Boolean
		{
			return playerData.currentScore >= currentBetData.limitScore;
		}
		
		/**
		 * 检测游戏是否结束
		 */
		public function get isGameOver():Boolean
		{
			return playerData.score <= 0;
		}
		
		
		/**
		 * 结束关卡
		 */
		public function stop():void
		{
			_isPlaying = false;
			
		}
		
		// 关卡逻辑控制部分 ↑
		
		// 组件部分 ↓
		
		/**
		 * 玩家状态栏
		 */
		private var playerBar:RoleDialog;
		
		private var _playerData:RoleData;
		
		/**
		 * 猜拳选项卡实例
		 */
		private var morraQuiz:MorraQuiz;
		
		/**
		 * 实时选项卡实例
		 */
		private var factQuiz:FactQuiz;
		
		/**
		 * 下注选项卡实例
		 */
		private var betsQuiz:BetsQuiz;
		
		/**
		 * 摇奖选项卡
		 */
		private var guessQuiz:GuessQuiz;
		
		/**
		 * 公布选项卡
		 * <br/>
		 * 将最终的猜拳结果显示出来
		 */
		private var resultQuiz:ResultQuiz;
		
		/**
		 * 更新玩家的分数显示
		 */
		private function updatePlayerScore():void
		{
			playerBar.scoreValueText = String(retolder.parseToInt(playerData.score));
			
			playerBar.targetScoreValueText = String(retolder.parseToInt(currentBetData.limitScore));
			
			playerBar.currentScoreValueText = String(retolder.parseToInt(playerData.currentScore));
			
		}
		
		/**
		 * 注入组件
		 */
		public function injectToLevel(soul:Object):void
		{
			_playerData = soul.playerData;
			
			playerBar = soul.playerBar;
			
			morraQuiz = soul.morra;
			
			factQuiz = soul.fact;
			
			betsQuiz = soul.bet;
			
			resultQuiz = soul.result;
			
			guessQuiz = soul.guess;
			
			retolder.addChildToParent(playerBar.mainContainer, mainContainer);
			
			retolder.addChildToParent(factQuiz.mainContainer, mainContainer);
			
		}
		
		// 组件部分 ↑ 结束
		
		// getter/setter部分 ↓
		
		private var _isPlaying:Boolean = false;

		/**
		 * 是否正在游戏关卡进行的过程中
		 */
		public function get isPlaying():Boolean
		{
			return _isPlaying;
		}

		
		private var _isPaused:Boolean = false;

		/**
		 * 是否处于暂停中
		 */
		public function get isPaused():Boolean
		{
			return _isPaused;
		}

		
		private var _gameOverHandler:Function;

		/**
		 * 游戏结束要做的事情
		 */
		public function get gameOverHandler():Function
		{
			return _gameOverHandler;
		}

		/**
		 * @private
		 */
		public function set gameOverHandler(value:Function):void
		{
			_gameOverHandler = value;
		}

		
		private var _levelClearHandler:Function;

		/**
		 * 游戏过关要做的事情
		 */
		public function get levelClearHandler():Function
		{
			return _levelClearHandler;
		}

		/**
		 * @private
		 */
		public function set levelClearHandler(value:Function):void
		{
			_levelClearHandler = value;
		}

		
		private var _pauseHandler:Function;

		/**
		 * 暂停时要做的事情
		 */
		public function get pauseHandler():Function
		{
			return _pauseHandler;
		}

		/**
		 * @private
		 */
		public function set pauseHandler(value:Function):void
		{
			_pauseHandler = value;
		}

		
		private var _stillHandler:Function;

		/**
		 * 从暂停中取消暂停时要做的事情
		 */
		public function get stillHandler():Function
		{
			return _stillHandler;
		}

		/**
		 * @private
		 */
		public function set stillHandler(value:Function):void
		{
			_stillHandler = value;
		}

		/**
		 * 猜拳数据
		 * <br/>
		 * 猜拳游戏所需要的逻辑数据
		 */
		public function get morraData():MorraLevelData
		{
			return _morraData;
		}
		
		/**
		 * 玩家数据的引用
		 */
		public function get playerData():RoleData
		{
			return _playerData;
		}
		
		private var _currentBetData:Object;

		/**
		 * 当前关卡对应的下注数据
		 * <br/>
		 * 里面有要求的过关分数 玩家在这关赢取的分数 必须要高于这个数
		 */
		public function get currentBetData():Object
		{
			return _currentBetData;
		}

		/**
		 * @private
		 */
		public function set currentBetData(value:Object):void
		{
			_currentBetData = value;
		}

		
		
	}
}