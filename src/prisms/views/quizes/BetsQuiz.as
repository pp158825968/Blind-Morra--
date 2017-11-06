package prisms.views.quizes
{
	
	import prisms.jars.QuizJar;
	import prisms.jars.UIKeysJar;
	import prisms.mediators.Arrester;
	import prisms.models.LevelBetData;
	import prisms.models.roles.MorraLevelData;
	import prisms.models.roles.RoleData;
	import prisms.uis.buttons.BaseButton;

	/**
	 * 下注选项卡
	 * <br/>
	 * 如无意外 这卡将是本作中最为精华的部分了
	 * <br/>
	 * 使劲怂恿玩家去all-in 然后进行“幻觉挑战”
	 */
	public class BetsQuiz extends BaseQuiz
	{
		/**
		 * 下注选项卡
		 * <br/>
		 * 如无意外 这卡将是本作中最为精华的部分了
		 * <br/>
		 * 使劲怂恿玩家去all-in 然后进行“幻觉挑战”
		 */
		public function BetsQuiz(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
		}
		
		
		/**
		 * 初始化组件
		 */
		override protected function initComponents():void
		{
			super.initComponents();
			
			initLabels();
			
		}
		
		/**
		 * 提问的文本标签
		 */
		private var quizLabel:Object;
		
		/**
		 * 初始化问题标签
		 */
		private function initLabels():void
		{
			var quziText:String = Arrester.getLanguageText(QuizJar.BETS_QUIZ);
			
			quizLabel = retolder.getTextField(quziText);
		}
		
		
		/**
		 * 把组件放到舞台上
		 */
		override protected function addComponentsToStage():void
		{
			super.addComponentsToStage();
			
			retolder.addChildToParent(quizLabel, mainContainer);
			
		}
		
		/**
		 * 组件布局
		 */
		override protected function layoutComponents():void
		{
			var marginX:Number = 10;
			var marginY:Number = 20;
			
			var gapX:Number = 15;
			var gapY:Number = 20;
			
			
			
			// 标签
			var quizLabelWidth:Number = Number(retolder.getProperty(quizLabel, "width"));
			var quizLabelHeight:Number = Number(retolder.getProperty(quizLabel, "height"));
			var quizLabelX:Number = (width - quizLabelWidth) * 0.5;
			var quizLabelY:Number = marginY;
			retolder.setProperty(quizLabel, quizLabelX, "x");
			retolder.setProperty(quizLabel, quizLabelY, "y");
			
		}	
		
		
		/**
		 * 发出选择结果事件
		 */
		private function dispatchSelectedComplete():void
		{
			dispatchEvent(SELECTED_COMPLETE);
		}
		
		/**
		 * 存放下注按钮的数组
		 */
		private var buttons:Array = [];
		
		/**
		 * 更新下注选项
		 */
		public function updateBets():void
		{
			updateButtons();
			
			layoutComponents();
			
		}
		
		/**
		 * 创建/更新下注选项
		 */
		private function updateButtons():void
		{
			var playerData:RoleData = Arrester.levelManager.levelTend.playerData;
			var betData:Object = Arrester.levelManager.levelTend.currentBetData;
			
			var bets:Array = betData.bets;
			var totalLength:int = retolder.max(bets.length, buttons.length);
			
			// 如果玩家当前的分数不足以去下某一个分数注的话 那么这个分数的按钮会被换成all in选项
			// 集齐全部all in将会得到一次终极逆转并且能进行偷看的机会
			
			var allInCount:int = 0;
			
			for (var i:int = 0; i < totalLength; i++) 
			{
				var button:Object = buttons[i];
				var betScore:Object = bets[i];
				
				var isAllIn:Boolean = (betScore is String) 
					|| playerData.score <= retolder.parseToInt(betScore) ;
				
				var buttonLabel:String = isAllIn ? 
					Arrester.getLanguageText(UIKeysJar.ALL_IN) : String(betScore);
				
				if(button)
				{
					if(!betScore)
					{
						retolder.removeChildToParent(button);
						continue;
					}
					
					button.labelText = buttonLabel;
				}
				else
				{
					button = Arrester.buttonManager.buildButton(buttonLabel);
					
					buttons.push(button);
				}
				
				button.data = isAllIn ? UIKeysJar.ALL_IN : betScore;
				
//				trace("button.data " + button.data);
				
				if(isAllIn)
				{
					allInCount++;
				}
				
				// 布局并且放到舞台上显示
				var lastButton:Object = buttons[i - 1];
				var position:Object = getButtonLayoutPosition(button, lastButton, totalLength);
				
				retolder.setProperty(button, position.x, "x");
				retolder.setProperty(button, position.y, "y");
				
				
				retolder.addEventListener(button, retolder.click, onButtonClick, this);
				
				retolder.addChildToParent(button.mainContainer, mainContainer);
				
			}
			
			// 判断是否进行偷看挑战
			Arrester.levelManager.levelTend.morraData.isWillGuessd = allInCount == totalLength;
			
		}
		
		/**
		 * 点击投注额按钮进行下注
		 */
		private function onButtonClick(event:Object):void
		{
			// 这个event在Laya下 就不是Event了 二十“data”
			
			// 怎么把这个Data提取出来
			
			removeButtonsListener();
			
			var playerData:RoleData = Arrester.levelManager.levelTend.playerData;
			var morraData:MorraLevelData = Arrester.levelManager.levelTend.morraData;
			
			var betScore:int = event.data.data == UIKeysJar.ALL_IN ?
				playerData.score : retolder.parseToInt(event.data.data);
			
//			trace("In Bet");
			
			playerData.beforeBetScore = playerData.score;
			
			playerData.score -= betScore;
			
			morraData.playerBetScore = betScore;
			
//			trace("终结event不是Event " + event);
//			trace(event is BaseButton);
//			trace("event.data " + event.data);
//			trace("event.data.data " + event.data.data);
			
			dispatchSelectedComplete();
			
		}
		
		/**
		 * 移除所有按钮的侦听器
		 */
		private function removeButtonsListener():void
		{
			for each(var button:Object in buttons) 
			{
				button.removeEventListener(retolder.click, onButtonClick, this);
			}
			
		}
		
		/**
		 * 计算下按钮布局
		 */
		private function getButtonLayoutPosition(currentButton:Object, 
												 lastButton:Object, buttonCount:int):Object
		{
			var gapX:Number = 15;
			var gapY:Number = 20;
			
			var buttonY:Number = 140;
			
			var quizLabelHeight:Number = Number(retolder.getProperty(quizLabel, "height"));
			var quizLabelY:Number = quizLabel.y;
			
			
			var xPos:Number;
			
			if(!lastButton)
			{
				var buttonWidth:Number = Number(retolder.getProperty(currentButton, "width"));
				var buttonLayoutWidth:Number = buttonWidth * buttonCount + gapX * (buttonCount - 1);
				xPos = (width - buttonLayoutWidth) * 0.5;
			}
			else
			{
				var lastButtonPosX:Number = Number(retolder.getProperty(lastButton, "x"));
				var lastButtonWidth:Number = Number(retolder.getProperty(lastButton, "width"));
				xPos = lastButtonPosX + lastButtonWidth + gapX;
			}
			
			var yPos:Number = buttonY; // quizLabelY + quizLabelHeight + gapY;
			
			return {x:xPos, y:yPos};
		}
		
		
		
	}
}