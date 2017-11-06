package prisms.views.quizes
{
	import prisms.jars.QuizJar;
	import prisms.mediators.Arrester;
	import prisms.uis.buttons.BaseButton;
	
	/**
	 * 猜拳选项卡
	 * <br/>
	 * 包剪锤选好一个 买定离手
	 */
	public class MorraQuiz extends BaseQuiz
	{
		
		/**
		 * 猜拳选项卡
		 * <br/>
		 * 包剪锤选好一个 买定离手
		 */
		public function MorraQuiz(bgColor:uint = 0x886677)
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
		 * 包按钮
		 */
		private var paperButton:Object;
		
		/**
		 * 剪按钮
		 */
		private var scissorButton:Object;
		
		/**
		 * 锤按钮
		 */
		private var rockButton:Object;
		
		
		/**
		 * 初始化问题标签
		 */
		private function initLabels():void
		{
			var quziText:String = Arrester.getLanguageText(QuizJar.MORRA_QUIZ);
			
			quizLabel = retolder.getTextField(quziText);
		}
		
		/**
		 * 初始化按钮
		 */
		private function initButtons():void
		{
			paperButton = Arrester.buttonManager.paperButton;
			
			scissorButton = Arrester.buttonManager.scissorButton;
			
			rockButton = Arrester.buttonManager.rockButton;
			
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
			// 需要一个添加到舞台的事件
			retolder.addEventListener(mainContainer, retolder.added_to_stage, onAdded, this);
			
		}
		
		/**
		 * 把组件放到舞台上
		 */
		override protected function addComponentsToStage():void
		{
			super.addComponentsToStage();
			
			retolder.addChildToParent(quizLabel, mainContainer);
			
			retolder.addChildToParent(paperButton.mainContainer, mainContainer);
			
			retolder.addChildToParent(scissorButton.mainContainer, mainContainer);
			
			retolder.addChildToParent(rockButton.mainContainer, mainContainer);
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
			var paperButtonWidth:Number = Number(retolder.getProperty(paperButton, "width"));
			var paperButtonHeight:Number = Number(retolder.getProperty(paperButton, "height"));
			
			var scissorButtonWidth:Number = Number(retolder.getProperty(scissorButton, "width"));
			var scissorButtonHeight:Number = Number(retolder.getProperty(scissorButton, "height"));
			
			var rockButtonWidth:Number = Number(retolder.getProperty(rockButton, "width"));
			var rockButtonHeight:Number = Number(retolder.getProperty(rockButton, "height"));
			
			// 按钮横着牌起来的占位宽度
			var buttonsLayoutWidth:Number = paperButtonWidth + gapX 
				+ scissorButtonWidth + gapX + rockButtonWidth;
			
			var paperButtonX:Number = (width - buttonsLayoutWidth) * 0.5;
			var paperButtonY:Number = buttonY; // quizLabelY + quizLabelHeight + gapY;
			retolder.setProperty(paperButton, paperButtonX, "x");
			retolder.setProperty(paperButton, paperButtonY, "y");
			
			var scissorButtonX:Number = paperButtonX + paperButtonWidth + gapX;
			var scissorButtonY:Number = buttonY; //quizLabelY + quizLabelHeight + gapY;
			retolder.setProperty(scissorButton, scissorButtonX, "x");
			retolder.setProperty(scissorButton, scissorButtonY, "y");
			
			var rockButtonX:Number = scissorButtonX + scissorButtonWidth + gapX;
			var rockButtonY:Number = buttonY; //quizLabelY + quizLabelHeight + gapY;
			retolder.setProperty(rockButton, rockButtonX, "x");
			retolder.setProperty(rockButton, rockButtonY, "y");
			
			
		}	
		
		/**
		 * 把组件放到舞台上
		 */
		private function onAdded(event:Object):void
		{
			// 为了保证三个按钮还在显示
			
			setupClickButton();
			
			layoutComponents();
			
			addComponentsToStage();
			
		}
		
		/**
		 * 激活按钮点击事件
		 */
		public function setupClickButton():void
		{
			retolder.addEventListener(paperButton.mainContainer, retolder.click, onPaperClick, this);
			
			retolder.addEventListener(scissorButton.mainContainer, retolder.click, onScissorClick, this);
			
			retolder.addEventListener(rockButton.mainContainer, retolder.click, onRockClick, this);
			
		}
		
		/**
		 * 取消按钮点击事件
		 */
		public function setoffClickButton():void
		{
			retolder.removeEventListener(paperButton.mainContainer, retolder.click, onPaperClick, this);
			
			retolder.removeEventListener(scissorButton.mainContainer, retolder.click, onScissorClick, this);
			
			retolder.removeEventListener(rockButton.mainContainer, retolder.click, onRockClick, this);
		}
		
		/**
		 * 点击石头按钮 选择石头
		 */
		private function onPaperClick(event:Object):void
		{
			Arrester.levelManager.levelTend.morraData.playerSign = QuizJar.PAPER;
			
			setoffClickButton();
			
			dispatchSelectedComplete();
		}
		
		/**
		 * 点击石头按钮 选择石头
		 */
		private function onScissorClick(event:Object):void
		{
			Arrester.levelManager.levelTend.morraData.playerSign = QuizJar.SCISSOR;
			
			setoffClickButton();
			
			dispatchSelectedComplete();
		}
		
		/**
		 * 点击石头按钮 选择石头
		 */
		private function onRockClick(event:Object):void
		{
			Arrester.levelManager.levelTend.morraData.playerSign = QuizJar.ROCK;
			
			setoffClickButton();
			
			dispatchSelectedComplete();
		}
		
		/**
		 * 发出选择结果事件
		 */
		private function dispatchSelectedComplete():void
		{
			dispatchEvent(SELECTED_COMPLETE);
		}
		
		
		
	}
}