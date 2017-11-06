package prisms.views
{
	import prisms.mediators.Arrester;
	import prisms.views.tenteis.uis.BaseTent;
	
	/**
	 * 切图器
	 * <br/>
	 * 显示系统的出拳
	 * <br/>
	 * 在达到一定条件下 玩家可以来提取偷看出拳结果
	 */
	public class VisualPhoto extends BaseTent
	{
		
		/**
		 * 切图器 虽说是切换图片器 
		 * <br/>
		 * 但实际上并没有图
		 * <br/>
		 * 显示系统的出拳
		 * <br/>
		 * 在达到一定条件下 玩家可以来提取偷看出拳结果
		 */
		public function VisualPhoto(bgColor:uint = 0x886677)
		{
			super(bgColor);
			
		}
		
		
		/**
		 * 初始化组件
		 */
		override protected function initComponents():void
		{
			super.initComponents();
			
			// 这个组件的大小是100*100
			initContainers();
		}
		
		
		
		/**
		 * 创建容器
		 */
		private function initContainers():void
		{
			initCoatContainer();
			
			initTruthLabel();
			
			initMask();
		}
		
		
		/**
		 * 谜底标签
		 */
		private var truthLabel:Object;
		
		/**
		 * 谜底标签 最后猜拳的结果会在这里显示
		 * <br/>
		 * 当然 可以偷看
		 */
		private function initTruthLabel():void
		{
			truthLabel = retolder.getTextField("Truth");
			
		}
		
		
		/**
		 * 遮罩方块
		 */
		private var maskShape:Object;
		
		/**
		 * 初始化遮罩
		 */
		private function initMask():void
		{
			maskShape = retolder.getRect(width, height);
			
			retolder.addMask(mainContainer, maskShape, mainContainer);
		}
		
		/**
		 * 涂层容器
		 */
		private var coatContainer:BaseViewContainer; 
		
		/**
		 * 涂层文本框
		 * <br/>
		 * 一般不明所以的显示一个问号
		 */
		private var coatLabel:Object;
		
		/**
		 * 涂层的背景方块
		 */
		private var coatRect:Object;
		
		/**
		 * 初始化涂层容器
		 */
		private function initCoatContainer():void
		{
			coatContainer = new BaseViewContainer();
			
			coatLabel = retolder.getTextField("?");
			
			coatRect = retolder.getRect(
				100, 100, 0x808060);
			
			retolder.setMouseRange(coatContainer.mainContainer, coatRect.width, coatRect.height);
			
			retolder.setProperty(coatContainer.mainContainer, false, "mouseChildren");
			
			retolder.setProperty(coatContainer.mainContainer, true, "buttonMode");
		}
		
		/**
		 * 初始化一个背景
		 */
		override protected function initBg():void
		{
			bgRect = retolder.getRect(
				100, 100, 0x886000);
			
		}
		
		/**
		 * 初始化组建的基本布局
		 */
		override protected function initLayoutComponents():void
		{
			layoutCoatContainer();
		}
		
		/**
		 * 对涂层进行布局
		 */
		private function layoutCoatContainer():void
		{
			var coatLabelWidth:Number = Number(retolder.getProperty(coatLabel, "width"));
			var coatLabelHeight:Number = Number(retolder.getProperty(coatLabel, "height"));
			
			var coatRectWidth:Number = Number(retolder.getProperty(coatRect, "width"));
			var coatRectHeight:Number = Number(retolder.getProperty(coatRect, "height"));
			
			var coatLabelX:Number = (coatRectWidth - coatLabelWidth) * 0.5;
			var coatLabelY:Number = (coatRectHeight - coatLabelHeight) * 0.5;
			
			retolder.setProperty(coatLabel, coatLabelX, "x");
			retolder.setProperty(coatLabel, coatLabelY, "y");
			
			retolder.setProperty(coatContainer, 0, "x");
			retolder.setProperty(coatContainer, 0, "y");
			
		}
		
		/**
		 * 把组件放到舞台上
		 */
		override protected function addComponentsToStage():void
		{
			super.addComponentsToStage();
			
			retolder.addChildToParent(truthLabel, mainContainer);
			
			retolder.addChildToParent(coatRect, coatContainer.mainContainer);
			retolder.addChildToParent(coatLabel, coatContainer.mainContainer);
			retolder.addChildToParent(coatContainer.mainContainer, mainContainer);
			
		}
		
		/**
		 * 组件布局
		 */
		override protected function layoutComponents():void
		{
			retolder.setProperty(coatContainer, 0, "x");
			retolder.setProperty(coatContainer, 0, "y");
		}		
		
		private var _truthText:String;

		/**
		 * 修改谜底标签上的文本
		 */
		public function get truthText():String
		{
			return _truthText;
		}

		/**
		 * @private
		 */
		public function set truthText(value:String):void
		{
			_truthText = value;
			
			retolder.setTextInField(truthLabel, _truthText);
			
			layoutTruthLabelPosition();
		}
		
		/**
		 * 对谜底标签进行居中布局
		 */
		private function layoutTruthLabelPosition():void
		{
			var truthLabelWidth:Number = Number(retolder.getProperty(truthLabel, "width"));
			var truthLabelHeight:Number = Number(retolder.getProperty(truthLabel, "height"));
			
			truthLabelX = (width - truthLabelWidth) * 0.5;
			truthLabelY = (height - truthLabelHeight) * 0.5;
			
			retolder.setProperty(truthLabel, truthLabelX, "x");
			retolder.setProperty(truthLabel, truthLabelY, "y");
			
		}		
		
		/**
		 * 揭开最终的谜底
		 */
		public function showTruth(isRemoveCoat:Boolean):void
		{
			if(isRemoveCoat)
			{
				retolder.removeChildToParent(coatContainer.mainContainer);
			}
			else
			{
				retolder.tweenGeen(coatContainer, {time:1, x:0, y:0, rotation:90, 
					onComplete:function():void
					{
						retolder.removeTweenTo(coatContainer);	
					}})
			}
			
			// trace("_onlyTruth " + _onlyTruth);
			
			retolder.setTextInField(truthLabel, _onlyTruth);
			
			retolder.tweenGeen(truthLabel, {time:1, x:truthLabelX, y:truthLabelY, 
				onComplete:function():void
				{
					layoutTruthLabelPosition();
				}});
			
			
			
		}
		
		/**
		 * 重设谜底
		 * <br/>
		 * 回复原状
		 */
		public function resetTruth():void
		{
			_onlyTruth = "";
			
			truthText = "";
			
			retolder.removeTweenTo(coatRect);
			
			var randomColor:uint = retolder.parseToInt(retolder.random() * 0xEEEEEE);
			
			// trace("randomColor " + randomColor);
			
			retolder.setProperty(bgRect, randomColor, "color");
			
			retolder.setProperty(coatRect, 0x808060, "color");
			
			retolder.setProperty(coatContainer, 0, "rotation");
			
			layoutTruthLabelPosition();
			
			layoutComponents();
			
			addComponentsToStage();
		}
		
		/**
		 * 移走涂层
		 */
		public function moveTheCoat():void
		{
			var targetX:Number = retolder.random() * width + width;
			var targetY:Number = retolder.random() * height + height;
			
			retolder.tweenGeen(coatContainer, {time:0.2, 
				x:targetX, y:targetY});
		}
		
		/**
		 * 让涂层变得闪烁
		 */
		public function twinkleCoat():void
		{
			// 让涂层容器可以被点击一次
			retolder.addEventListener(coatContainer.mainContainer, 
				retolder.click, onCoatContainerMainContainer, this);
			
			retolder.setProperty(coatContainer.mainContainer, true, "buttonMode");
			
			tweenOrangeOne();
			
			// 一种颜色缓动完 就要向另一种颜色缓动过去
			function tweenOrangeOne():void
			{
				retolder.removeTweenTo(coatRect);
				retolder.tweenGeen(coatRect, 
					{
						time:0.5, 
						onComplete:function():void
						{
							retolder.setProperty(coatRect, 0xEEEEB0, "color");
							
							tweenOrangeTwo();
						}
					});
			}
			
			function tweenOrangeTwo():void
			{
				retolder.removeTweenTo(coatRect);
				retolder.tweenGeen(coatRect, 
					{
						time:0.7, 
						onComplete:function():void
						{
							retolder.setProperty(coatRect, 0xDDDDD0, "color");
							
							tweenOrangeOne();
						}
					});
			}
			
		}
		
		/**
		 * 点击进行偷看
		 * <br/>
		 * 主要就是对涂层以及谜底的位置进行随机的调整
		 */
		private function onCoatContainerMainContainer(event:Object):void
		{
			
			retolder.removeEventListener(coatContainer.mainContainer, 
				retolder.click, onCoatContainerMainContainer, this);
			
			retolder.setProperty(coatContainer.mainContainer, false, "buttonMode");
			
			retolder.setTextInField(truthLabel, onlyTruth);
			
			emboskTruth();
		}
		
		/**
		 * 涂层被点击移开的时候 发出偷看揭底事件
		 */
		public static const EMBOSK:String = "embosk";
		
		/**
		 * 偷看谜底
		 * <br/>
		 * 在这里实现偷看功能 但并不是 每次都能让玩家 稳稳的看到
		 * <br/>
		 * 甚至给玩家看到的 <b>是假的</b>
		 */
		private function emboskTruth():void
		{
			fixCoat();
			
			fixLabelPositon();
			
			dispatchEvent(EMBOSK);
		}
		
		/**
		 * 调整的涂层
		 * <br/>
		 * 涂层会随机出现旋转 移动等效果
		 */
		private function fixCoat():void
		{
			var rotation:Number = 20 + 50 * retolder.random();
			
			var xPos:Number = 30 * retolder.random();
			var yPos:Number = 30 * retolder.random();
			
			retolder.setProperty(coatContainer, rotation, "rotation");
			retolder.setProperty(coatContainer, xPos, "x");
			retolder.setProperty(coatContainer, yPos, "y");
			
			
		}
		
		/**
		 * 修改一下真相文本框的位置
		 */
		private function fixLabelPositon():void
		{
			var xPos:Number = -5 + 105 * retolder.random();
			var yPos:Number = -5 + 105 * retolder.random();
			
			retolder.setProperty(truthLabel, xPos, "x");
			retolder.setProperty(truthLabel, yPos, "y");
		}
		
		private var _onlyTruth:String = "";

		/**
		 * 标签的居中点
		 */
		private var truthLabelX:Number = 0;

		/**
		 * 标签的居中点
		 */
		private var truthLabelY:Number = 0;

		/**
		 * 最后要在显示的 真正的谜底
		 */
		public function get onlyTruth():String
		{
			return _onlyTruth;
		}

		/**
		 * @private
		 */
		public function set onlyTruth(value:String):void
		{
			_onlyTruth = value;
		}
		
		
	}
}