package prisms.views.quizes
{
	import prisms.jars.LanguageJar;
	import prisms.jars.QuizJar;
	import prisms.jars.UIKeysJar;
	import prisms.mediators.Arrester;
	
	/**
	 * 摇奖选项卡
	 * <br/>
	 * 当下注面板上的全部按钮都是all in的时候 可以进行竞猜
	 * <br/>
	 * 充钱才能变强
	 */
	public class GuessQuiz extends BaseQuiz
	{
		
		/**
		 * 摇奖选项卡
		 * <br/>
		 * 当下注面板上的全部按钮都是all in的时候 可以进行竞猜
		 * <br/>
		 * 充钱才能变强
		 */
		public function GuessQuiz(bgColor:uint = 0x886677)
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
		
		/**
		 * 初始化问题标签
		 */
		private function initLabels():void
		{
			quziText = Arrester.getLanguageText(QuizJar.GUESSING);
			
			quizLabel = retolder.getTextField(quziText);
		}
		
		/**
		 * 充值按钮
		 */
		private var pricelessButton:Object;
		
		/**
		 * 拒绝充值按钮
		 */
		private var cheapButton:Object;
		
		/**
		 * 坚信按钮
		 */
		private var believeButton:Object;
		
		/**
		 * 后悔按钮
		 */
		private var repentButton:Object;
		
		/**
		 * 初始化按钮们
		 */
		private function initButtons():void
		{
			pricelessButton = Arrester.buttonManager.pricelessButton;
			
			cheapButton = Arrester.buttonManager.cheapButton;
			
			believeButton = Arrester.buttonManager.believeButton;
			
			repentButton = Arrester.buttonManager.repentButton;
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
			addButtonListener();
		}
		
		/**
		 * 添加按钮事件侦听器
		 */
		private function addButtonListener():void
		{
			retolder.addEventListener(pricelessButton, retolder.click, onPricelessButtonClick, this);
			
			retolder.addEventListener(cheapButton, retolder.click, onCheapButtonClick, this);
			
			retolder.addEventListener(believeButton, retolder.click, onBelieveButtonClick, this);
			
			retolder.addEventListener(repentButton, retolder.click, onRepentButtonClick, this);
			
		}
		
//		/**
//		 * 移除按钮事件侦听器
//		 */
//		private function removeButtonListener():void
//		{
////			pricelessButton.removeEventListener(retolder.click, onPricelessButtonClick, this);
////			
////			cheapButton.removeEventListener(retolder.click, onCheapButtonClick, this);
////			
////			believeButton.removeEventListener(retolder.click, onBelieveButtonClick, this);
////			
////			repentButton.removeEventListener(retolder.click, onRepentButtonClick, this);
//			
//		}
		
		/**
		 * 点击充值
		 */
		private function onPricelessButtonClick(event:Object):void
		{
//			removeButtonListener();
			
			retolder.removeChildToParent(pricelessButton.mainContainer);
			
			retolder.removeChildToParent(cheapButton.mainContainer);
			
			dispatchEvent(PRICELESS_CLICK);
			
			var text:String = Arrester.getLanguageText(UIKeysJar.PRICE_FAIL) + "\n" + "\n"
				+ Arrester.getLanguageText(UIKeysJar.QUIZ_CLICK); 
			
			retolder.setTextInField(quizLabel, text);
			
			layoutComponents();
		}
		
		
		/**
		 * 点击拒绝充值
		 */
		private function onCheapButtonClick(event:Object):void
		{
			retolder.removeChildToParent(pricelessButton.mainContainer);
			
			retolder.removeChildToParent(cheapButton.mainContainer);
			
			retolder.setTextInField(quizLabel, Arrester.getLanguageText(UIKeysJar.CHEAP_CHOP));
			
			layoutComponents();
			
			retolder.removeTweenTo(this);
			
			retolder.tweenGeen(this, {time:1, 
				onComplete:function():void
				{
					dispatchEvent(CHEAP_CLICK);	
				}});
			
		}
		
		/**
		 * 点击坚信按钮之后
		 */
		private function onBelieveButtonClick(event:Object):void
		{
			dispatchEvent(BELIEVE_CLICK);
		}
		
		/**
		 * 点击拒绝充值
		 */
		private function onRepentButtonClick(event:Object):void
		{
			dispatchEvent(REPENT_CLICK);
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
			
			var buttonY:Number = 140;
			
			// 标签
			var quizLabelWidth:Number = Number(retolder.getProperty(quizLabel, "width"));
			var quizLabelHeight:Number = Number(retolder.getProperty(quizLabel, "height"));
			var quizLabelX:Number = (width - quizLabelWidth) * 0.5;
			var quizLabelY:Number = marginY;
			retolder.setProperty(quizLabel, quizLabelX, "x");
			retolder.setProperty(quizLabel, quizLabelY, "y");
			
			var pricelessButtonWidth:Number = Number(retolder.getProperty(pricelessButton, "width"));
			var pricelessButtonHeight:Number = Number(retolder.getProperty(pricelessButton, "height"));
			
			var cheapButtonWidth:Number = Number(retolder.getProperty(cheapButton, "width"));
			var cheapButtonHeight:Number = Number(retolder.getProperty(cheapButton, "height"));
			
			// 按钮横着牌起来的占位宽度
			var buttonsLayoutWidth:Number = pricelessButtonWidth + gapX 
				+ cheapButtonWidth;
			
			var pricelessButtonX:Number = (width - buttonsLayoutWidth) * 0.5;
			var pricelessButtonY:Number = buttonY; // quizLabelY + quizLabelHeight + gapY;
			retolder.setProperty(pricelessButton, pricelessButtonX, "x");
			retolder.setProperty(pricelessButton, pricelessButtonY, "y");
			
			var cheapButtonX:Number = pricelessButtonX + pricelessButtonWidth + gapX;
			var cheapButtonY:Number = buttonY; // quizLabelY + quizLabelHeight + gapY;
			retolder.setProperty(cheapButton, cheapButtonX, "x");
			retolder.setProperty(cheapButton, cheapButtonY, "y");
			
			retolder.setProperty(believeButton, pricelessButtonX, "x");
			retolder.setProperty(believeButton, pricelessButtonY, "y");
			
			retolder.setProperty(repentButton, cheapButtonX, "x");
			retolder.setProperty(repentButton, cheapButtonY, "y");
			
		}
		
		/**
		 * 刷新事件
		 * <br/>
		 * 主要是为了让外面的切图器不停的切换包剪锤
		 */
		public static const UPDATE_VISUAL:String = "update visual";
		
		/**
		 * 完成事件
		 * <br/>
		 * 刷新完成 显示最终结果
		 */
		public static const COMPLETE_VISUAL:String = "complete visual";
		
		/**
		 * 充值事件
		 * <br/>
		 * 充值可以进行挑战
		 */
		public static const PRICELESS_CLICK:String = "priceless click";
		
		/**
		 * 拒绝充值事件
		 * <br/>
		 * 显示真小气
		 */
		public static const CHEAP_CLICK:String = "cheap click";
		
		/**
		 * 坚信事件
		 * <br/>
		 * 充值可以进行挑战
		 */
		public static const BELIEVE_CLICK:String = "believe click";
		
		/**
		 * 反悔事件
		 * <br/>
		 * 做到这里
		 */
		public static const REPENT_CLICK:String = "repent click";
		
		/**
		 * 缓存一下“摇奖中”
		 */
		private var quziText:String;
		
		
		/**
		 * 刷新中
		 * <br/>
		 * 同时让切图器不断的切换包剪锤
		 */
		public function startGuess():void
		{
			var dots:Array = [".", "..", "..."];
			var index:int = 0;
			
			retolder.removeChildToParent(pricelessButton.mainContainer);
			
			retolder.removeChildToParent(cheapButton.mainContainer);
			
			retolder.removeChildToParent(believeButton.mainContainer);
			
			retolder.removeChildToParent(repentButton.mainContainer);
			
			retolder.removeTweenTo(this);
			
			retolder.setTextInField(quizLabel, quziText);
			
			layoutComponents();
			
			retolder.tweenGeen(this, {time:2, 
				onUpdate: function():void
				{
					var text:String  = quziText + dots[index];
					index++;
					index = index >= dots.length ? 0 : index;
					retolder.setTextInField(quizLabel, text);
					
					dispatchEvent(UPDATE_VISUAL);
				},
				onComplete: function():void
				{
					dispatchEvent(COMPLETE_VISUAL);
				}
			});
		}
		
		/**
		 * 偷看提示的文本
		 */
		private var peekText:String;
		
		/**
		 * 显示偷看提示
		 */
		public function showPeekTips():void
		{
			var text:String;
			
			peekText = Arrester.getLanguageText(QuizJar.PEEK_TIPS);
			
			var scoreText:String = makeScoreText();
			
			text = peekText + "\n" + "\n" + scoreText;
			
			retolder.setTextInField(quizLabel, text);
			
			// 再做一个充值按钮吧
			layoutComponents();
			
			retolder.removeChildToParent(believeButton.mainContainer);
			
			retolder.removeChildToParent(repentButton.mainContainer);
			
			retolder.addChildToParent(pricelessButton.mainContainer, mainContainer);
			
			retolder.addChildToParent(cheapButton.mainContainer, mainContainer);
		}
		
		/**
		 * 做出一条说明逆转倍数的提示
		 */
		private function makeScoreText():String
		{
			var targetText:String = Arrester.getLanguageText(QuizJar.WIN_BETS_TIP);
			
			// 倍数
			targetText = targetText.replace("{#1}", 
				Arrester.levelManager.levelTend.morraData.winValue);
			
			// 逆转后获得的分数
			var winSocre:int = 
				Arrester.levelManager.levelTend.morraData.getChargeScoreByResult(QuizJar.WIN);
			
			targetText = targetText.replace("{#2}", winSocre);
			
			return targetText;
		}
		
		/**
		 * 显示是否后悔按钮选项
		 * <br/>
		 * 后悔的话 玩家将重新选择猜拳
		 */
		public function showRepent():void
		{
			var text:String = Arrester.getLanguageText(QuizJar.REPENT_TIPS);
			
			retolder.setTextInField(quizLabel, text);
			
			layoutComponents();
			
			retolder.removeChildToParent(pricelessButton.mainContainer);
			
			retolder.removeChildToParent(cheapButton.mainContainer);
			
			retolder.addChildToParent(believeButton.mainContainer, mainContainer);
			
			retolder.addChildToParent(repentButton.mainContainer, mainContainer);
			
		}
		
		
		
	}
}