package prisms.mediators.owns
{
	import prisms.jars.LanguageJar;
	import prisms.jars.QuizJar;
	import prisms.mediators.Arrester;
	import prisms.models.bases.BaseRetoldObject;
	import prisms.uis.buttons.BaseButton;
	
	/**
	 * 按钮创建管理器
	 */
	public class UIButtonsManager extends BaseRetoldObject
	{
		
		/**
		 * 按钮创建管理器
		 */
		public function UIButtonsManager()
		{
			super();
			
			initButtonStyle();
		}
		
		/**
		 * 存放按钮样式的数组
		 */
		private var styleObjects:Array;
		
		/**
		 * 初始化按钮样式
		 */
		private function initButtonStyle():void
		{
			styleObjects = [
				{keyName:QuizJar.PAPER, color:0xDD22AA},
				{keyName:QuizJar.SCISSOR, color:0xDDDD00},
				{keyName:QuizJar.ROCK, color:0x22AADD}
			];
		}
		
		/**
		 * 存放所有按钮的数组
		 */
		private var uiButtons:Array = [];
		
		/**
		 * 开始按钮
		 */
		public var startButton:Object;
		
		/**
		 * 结束按钮
		 * <br/>
		 */
		public var overButton:Object;
		
		/**
		 * 重新开始按钮
		 * <br/>
		 * 放在通过幕里的
		 */
		public var restartButton:Object;
		
		/**
		 * 知道按钮
		 * <br/>
		 * 在介绍幕里会出现的
		 */
		public var knowButton:Object;
		
		/**
		 * 暂停按钮
		 */
		public var pauseButton:Object;
		
		/**
		 * 继续游戏按钮
		 */
		public var stillButton:Object;
		
		/**
		 * 暂停幕里面的介绍按钮
		 * <br/>
		 */
		public var destructionButton:Object;
		
		/**
		 * 包按钮
		 */
		public var paperButton:Object;
		
		/**
		 * 剪按钮
		 */
		public var scissorButton:Object;
		
		/**
		 * 锤按钮
		 */
		public var rockButton:Object;
		
		/**
		 * 锤按钮
		 */
		public var agreeButton:Object;
		
		/**
		 * 充值按钮
		 */
		public var pricelessButton:Object;
		
		/**
		 * 拒绝充值按钮
		 */
		public var cheapButton:Object;
		
		/**
		 * 坚信按钮
		 */
		public var believeButton:Object;
		
		/**
		 * 拒绝充值按钮
		 */
		public var repentButton:Object;
		
		/**
		 * 创建所有ui所需要的按钮
		 */
		public function standardToButtons():void
		{
			LanguageJar.initKeys();
			
			var keys:Array = LanguageJar.languageKeys;
			
			keys = keys.concat(QuizJar.morraSigns);
			
			for each (var keyName:String in keys) 
			{
				// 通过拼合字符串的形式 
				// 找出按钮实例 然后在对按钮进行实例化
				var buttonName:String = keyName + "Button";
				
				this[buttonName] = buildButton(keyName);
			}
			
			
			
		}
		
		/**
		 * 默认的按钮颜色
		 */
		private var buttonColor:uint = 0xDDDDDD;
		
		/**
		 * 创建按钮的方法
		 */
		public function buildButton(keyName:String):Object
		{
			// 拿到对应语言下的多语言字符串
			var labelText:String = Arrester.getLanguageText(keyName, keyName);
			
			var styleObject:Object = findStyleObject(keyName);
			
			var tempButtonColor:uint = styleObject ? styleObject.color : buttonColor;
			
			var button:Object = new BaseButton(labelText, tempButtonColor);
			
			return button;
		}
		
		/**
		 * 根据字段获取按钮
		 */
		public function findButton(keyName:String):Object
		{
			var buttonName:String = keyName + "Button";
			
			return this[buttonName];
		}
		
		/**
		 * 给按钮找到对应的样式数据
		 */
		protected function findStyleObject(keyName:String):Object
		{
			var targetObject:Object
			
			for each (var styleObject:Object in styleObjects) 
			{
				if(styleObject.keyName == keyName)
				{
					targetObject = styleObject;
					break;
				}
			}
			
			
			return targetObject;
		}
		
		
	}
}