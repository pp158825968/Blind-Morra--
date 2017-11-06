package prisms.views.quizes
{
	import prisms.jars.QuizJar;
	import prisms.mediators.Arrester;
	
	/**
	 * 最终揭开谜底的选项卡
	 * <br/>
	 * 赢够分数的话 点按钮进入下一关 输了就DeepDarkFantasy
	 */
	public class ResultQuiz extends BaseQuiz
	{
		/**
		 * 最终揭开谜底的选项卡
		 * <br/>
		 * 赢够分数的话 点按钮进入下一关 输了就DeepDarkFantasy
		 */
		public function ResultQuiz(bgColor:uint = 0x886677)
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
			
			initButtons();
			
		}
		
		/**
		 * 提问的文本标签
		 */
		private var quizLabel:Object;
		
		// 包剪锤三个按钮选项
		
		/**
		 * 确认按钮
		 * <br/>
		 * 点完这个按钮 结束完一次猜拳的进程
		 */
		private var agreeButton:Object;
		
		/**
		 * 初始化问题标签
		 */
		private function initLabels():void
		{
			var quziText:String = Arrester.getLanguageText("Result");
			
			quizLabel = retolder.getTextField(quziText);
		}
		
		/**
		 * 初始化按钮
		 */
		private function initButtons():void
		{
			agreeButton = Arrester.buttonManager.agreeButton;
		}
		
		/**
		 * 初始化组建的基本布局
		 */
		override protected function initLayoutComponents():void
		{
			layoutComponents();
		}
		
		/**
		 * 初始化侦听器
		 */
		override protected function initListeners():void
		{
			retolder.addEventListener(agreeButton, retolder.click, onAgreeButtonClick, this);
		}
		
		/**
		 * 结果确认完毕 进入下一步操作
		 */
		private function onAgreeButtonClick(event:Object):void
		{
			dispatchEvent(SELECTED_COMPLETE);
		}
		
		/**
		 * 把组件放到舞台上
		 */
		override protected function addComponentsToStage():void
		{
			super.addComponentsToStage();
			
			retolder.addChildToParent(quizLabel, mainContainer);
			
			retolder.addChildToParent(agreeButton.mainContainer, mainContainer);
			
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
			
			var buttonY:Number = 140;
			
			// 标签
			var quizLabelWidth:Number = Number(retolder.getProperty(quizLabel, "width"));
			var quizLabelHeight:Number = Number(retolder.getProperty(quizLabel, "height"));
			var quizLabelX:Number = (width - quizLabelWidth) * 0.5;
			var quizLabelY:Number = marginY;
			retolder.setProperty(quizLabel, quizLabelX, "x");
			retolder.setProperty(quizLabel, quizLabelY, "y");
			
			// 按钮
			var agreeButtonWidth:Number = Number(retolder.getProperty(agreeButton, "width"));
			var agreeButtonHeight:Number = Number(retolder.getProperty(agreeButton, "height"));
			
			var agreeLabelX:Number = (width - agreeButtonWidth) * 0.5;
			var agreeLabelY:Number = buttonY; // quizLabelY + quizLabelHeight + gapY;
			
			retolder.setProperty(agreeButton, agreeLabelX, "x");
			retolder.setProperty(agreeButton, agreeLabelY, "y");
			
		}
		
		private var _result:String;

		/**
		 * 显示结果
		 */
		public function get result():String
		{
			return _result;
		}

		/**
		 * @private
		 */
		public function set result(value:String):void
		{
			_result = value;
			
			showResults();
			
			
		}
		
		/**
		 * 显示结果
		 */
		private function showResults():void
		{
			updateLabelText();
			
			updateButtonLabel();
			
			layoutComponents();
			
		}		
		
		
		/**
		 * 更新标签文本
		 */
		private function updateLabelText():void
		{
			// 第一行说明胜负
			var playerName:String = Arrester.getLanguageText(QuizJar.PLAYER_NAME);
			var playerSignText:String = Arrester.getLanguageText(Arrester.levelManager.levelTend.morraData.playerSign);
			
			var computerName:String = Arrester.getLanguageText(QuizJar.COMPUTER_NAME);
			var computerSignText:String = Arrester.getLanguageText(Arrester.levelManager.levelTend.morraData.systemSign);
			var resultText:String = Arrester.getLanguageText(_result);
			
			var firstLine:String = playerName + playerSignText + resultText + computerName + computerSignText;
			
			var keyName:String = _result + "_tip";
			
			var secondLine:String = Arrester.getLanguageText(keyName);
			
			var text:String = firstLine + "\n" + "\n" + secondLine;
			
			retolder.setTextInField(quizLabel, text);
		}
		
		/**
		 * 更新按钮标签
		 */
		private function updateButtonLabel():void
		{
			var text:String;
			
			if(Arrester.levelManager.levelTend.isLevelClear)
			{
				text = Arrester.getLanguageText(QuizJar.LEVEL_CLEAR);
			}
			else if(Arrester.levelManager.levelTend.isGameOver)
			{
				text = Arrester.getLanguageText(QuizJar.LEVEL_OVER);
			}
			else
			{
				text = Arrester.getLanguageText(QuizJar.LEVEL_CONTINUE);
			}
			
			agreeButton.labelText = text;
		}
		
		
	}
}