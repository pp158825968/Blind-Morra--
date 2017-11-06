package prisms.uis.dialogs
{
	import prisms.views.BaseViewContainer;
	import prisms.views.tenteis.uis.BaseTent;

	/**
	 * 角色对话框
	 * <br/>
	 * 主要是用来玩家状态的 
	 * <br/>
	 * 放在关卡幕的左下角
	 * <br/>
	 * 考虑到背景重用 这里就先用BaseTent作为父类
	 */
	public class RoleDialog extends BaseTent
	{
		
		/**
		 * 角色对话框
		 * <br/>
		 * 主要是用来玩家状态的 
		 * <br/>
		 * 放在关卡幕的左下角
		 */
		public function RoleDialog()
		{
			super();
			
		}
		
		
		/**
		 * 初始化组件
		 */
		override protected function initComponents():void
		{
			super.initComponents();
			
			initRoleImageConatiner();
			
			initLabels();
			
			initSettings();
		}
		
		
		/**
		 * 初始化设置
		 */
		private function initSettings():void
		{
			retolder.setProperty(bgRect, 25, "height");
			
			retolder.setProperty(bgRect, 0.5, "alpha");
		}
		
		/**
		 * 图像部分
		 * <br/>
		 * 头像部分只是一个显示对象
		 */
		private var roleImageConatiner:BaseViewContainer;
		
		/**
		 * 角色头像框部分
		 */
		private function initRoleImageConatiner():void
		{
			roleImageConatiner = new BaseViewContainer();
		}
		
		/**
		 * 关卡标签
		 */
		private var levelLabel:Object;
		
		/**
		 * 分数标签
		 */
		private var scoreLabel:Object;
		
		/**
		 * 表示分数值的标签
		 * <br/>
		 * 这里显示玩家的分数
		 */
		private var scoreValueLabel:Object;
		
		/**
		 * 目标分数标签
		 */
		private var targetScoreLabel:Object;
		
		/**
		 * 目标分数值文本框
		 */
		private var targetScoreValueLabel:Object;
		
		/**
		 * 当前赢取分数的标签
		 */
		private var currentScoreLabel:Object;
		
		/**
		 * 当前赢取的分数值的标签
		 */
		private var currentScoreValueLabel:Object;
		
		/**
		 * 初始化标签部分
		 */
		private function initLabels():void
		{
			levelLabel = retolder.getTextField(_scoreLabelText);
			
			scoreLabel = retolder.getTextField(_scoreLabelText);
			
			scoreValueLabel = retolder.getTextField(_scoreValueText);
			
			targetScoreLabel = retolder.getTextField(_targetScoreLabelText);
			
			targetScoreValueLabel = retolder.getTextField(_targetScoreValueText);
			
			currentScoreLabel = retolder.getTextField(_currentScoreText);
			
			currentScoreValueLabel = retolder.getTextField(_currentScoreValueText);
			
		}
		
		
		/**
		 * 初始化组建的基本布局
		 */
		override protected function initLayoutComponents():void
		{
			layoutComponents();
		}
		
		
		/**
		 * 把组件放到舞台上
		 */
		override protected function addComponentsToStage():void
		{
			super.addComponentsToStage();
			
			retolder.addChildToParent(roleImageConatiner.mainContainer, mainContainer);
			
			retolder.addChildToParent(levelLabel, mainContainer);
			
			retolder.addChildToParent(scoreLabel, mainContainer);
			retolder.addChildToParent(scoreValueLabel, mainContainer);
			
			retolder.addChildToParent(targetScoreLabel, mainContainer);
			retolder.addChildToParent(targetScoreValueLabel, mainContainer);
			
			retolder.addChildToParent(currentScoreLabel, mainContainer);
			retolder.addChildToParent(currentScoreValueLabel, mainContainer);
			
		}
		
		
		/**
		 * 组件布局
		 */
		override protected function layoutComponents():void
		{
			var marginX:Number = 15;
			var gapX:Number = 10;
			var labelGapX:Number = 3;
			
			var bottomMarginY:Number = 5;
			var layoutWidth:Number = 45;
			
			// 头像框部分
			var imageWidth:Number = Number(retolder.getProperty(
				roleImageConatiner.mainContainer, "width"));
			var imageHeight:Number = Number(retolder.getProperty(
				roleImageConatiner.mainContainer, "height"));
			var imageX:Number = gapX;
			var imageY:Number = 0;
			retolder.setProperty(roleImageConatiner, imageX, "x");
			retolder.setProperty(roleImageConatiner, imageY, "y");
			
			// 标签布局
			
			// 关卡标签
			var levelLabelWidth:Number = Number(retolder.getProperty(
				levelLabel, "width"));
			var levelLabelHeight:Number = Number(retolder.getProperty(
				levelLabel, "height"));
			var levelLabelX:Number = imageX + imageWidth + gapX;
			var levelLabelY:Number = (height - levelLabelHeight) * 0.5;
			retolder.setProperty(levelLabel, levelLabelX, "x");
			retolder.setProperty(levelLabel, levelLabelY, "y");
			
			// 玩家分数标签框
			var scoreLabelWidth:Number = Number(retolder.getProperty(
				scoreLabel, "width"));
			var scoreLabelHeight:Number = Number(retolder.getProperty(
				scoreLabel, "height"));
			var scoreLabelX:Number = levelLabelX + levelLabelWidth + gapX;
			var scoreLabelY:Number = (height - scoreLabelHeight) * 0.5;
			retolder.setProperty(scoreLabel, scoreLabelX, "x");
			retolder.setProperty(scoreLabel, scoreLabelY, "y");
			
			// 玩家分数值标签
			var scoreValueWidth:Number = Number(retolder.getProperty(
				scoreValueLabel, "width"));
			var scoreValueHeight:Number = Number(retolder.getProperty(
				scoreValueLabel, "height"));
			var scoreValueLabelX:Number = scoreLabelX + scoreLabelWidth + labelGapX;
			var scoreValueLabelY:Number = (height - scoreValueHeight) * 0.5;
			retolder.setProperty(scoreValueLabel, scoreValueLabelX, "x");
			retolder.setProperty(scoreValueLabel, scoreValueLabelY, "y");
			
			// 过关分数标签
			var targetScoreLabelWidth:Number = Number(retolder.getProperty(
				targetScoreLabel, "width"));
			var targetScoreLabelHeight:Number = Number(retolder.getProperty(
				targetScoreLabel, "height"));
			var targetScoreLabelX:Number = scoreLabelX + scoreLabelWidth + layoutWidth;
			var targetScoreLabelY:Number = (height - targetScoreLabelHeight) * 0.5;
			retolder.setProperty(targetScoreLabel, targetScoreLabelX, "x");
			retolder.setProperty(targetScoreLabel, targetScoreLabelY, "y");
			
			// 过关分数值
			var targetScoreValueWidth:Number = Number(retolder.getProperty(
				targetScoreValueLabel, "width"));
			var targetScoreValueHeight:Number = Number(retolder.getProperty(
				targetScoreValueLabel, "height"));
			var targetScoreValueLabelX:Number = targetScoreLabelX + targetScoreLabelWidth;
			var targetScoreValueLabelY:Number = (height - targetScoreValueHeight) * 0.5;
			retolder.setProperty(targetScoreValueLabel, targetScoreValueLabelX, "x");
			retolder.setProperty(targetScoreValueLabel, targetScoreValueLabelY, "y");
			
			// 当前赢得的分数标签
			var currentScoreLabelWidth:Number = Number(retolder.getProperty(
				currentScoreLabel, "width"));
			var currentScoreLabelHeight:Number = Number(retolder.getProperty(
				currentScoreLabel, "height"));
			var currentScoreLabelX:Number = targetScoreLabelX + targetScoreLabelWidth + layoutWidth;
			var currentScoreLabelY:Number = (height - currentScoreLabelHeight) * 0.5;
			retolder.setProperty(currentScoreLabel, currentScoreLabelX, "x");
			retolder.setProperty(currentScoreLabel, currentScoreLabelY, "y");
			
			// 当前赢得的分数值
			var currentScoreValueWidth:Number = Number(retolder.getProperty(
				currentScoreValueLabel, "width"));
			var currentScoreValueHeight:Number = Number(retolder.getProperty(
				currentScoreValueLabel, "height"));
			var currentScoreValueLabelX:Number = currentScoreLabelX + currentScoreLabelWidth;
			var currentScoreValueLabelY:Number = (height - currentScoreValueHeight) * 0.5;
			retolder.setProperty(currentScoreValueLabel, currentScoreValueLabelX, "x");
			retolder.setProperty(currentScoreValueLabel, currentScoreValueLabelY, "y");
			
			
		}
		
		private var _levelLabelText:String = "";

		/**
		 * 关卡标签文本
		 */
		public function get levelLabelText():String
		{
			return _levelLabelText;
		}

		/**
		 * @private
		 */
		public function set levelLabelText(value:String):void
		{
			_levelLabelText = value;
			
			retolder.setTextInField(levelLabel, _levelLabelText);
			
			layoutComponents();
		}

		
		private var _scoreLabelText:String = "";

		/**
		 * hp标签文本
		 */
		public function get scoreLabelText():String
		{
			return _scoreLabelText;
		}

		/**
		 * @private
		 */
		public function set scoreLabelText(value:String):void
		{
			_scoreLabelText = value;
			
			retolder.setTextInField(scoreLabel, _scoreLabelText);
			
			layoutComponents();
		}

		
		private var _scoreValueText:String = "";

		/**
		 * hp值文本
		 * <br/>
		 * 这个应该是个百分比值
		 */
		public function get scoreValueText():String
		{
			return _scoreValueText;
		}

		/**
		 * @private
		 */
		public function set scoreValueText(value:String):void
		{
			_scoreValueText = value;
			
			retolder.setTextInField(scoreValueLabel, _scoreValueText);
			
			layoutComponents();
		}

		
		private var _targetScoreLabelText:String = "";

		/**
		 * 目标分数标签文本
		 */
		public function get targetScoreLabelText():String
		{
			return _targetScoreLabelText;
		}

		/**
		 * @private
		 */
		public function set targetScoreLabelText(value:String):void
		{
			_targetScoreLabelText = value;
			
			retolder.setTextInField(targetScoreLabel, _targetScoreLabelText);
			
			layoutComponents();
		}

		
		private var _targetScoreValueText:String = "";

		/**
		 * 目标分数值文本
		 * <br/>
		 */
		public function get targetScoreValueText():String
		{
			return _targetScoreValueText;
		}

		/**
		 * @private
		 */
		public function set targetScoreValueText(value:String):void
		{
			_targetScoreValueText = value;
			
			retolder.setTextInField(targetScoreValueLabel, _targetScoreValueText);
			
			layoutComponents();
		}
		
		
		private var _currentScoreText:String = "";

		/**
		 * 设置当前分数标签
		 */
		public function get currentScoreText():String
		{
			return _currentScoreText;
		}

		/**
		 * @private
		 */
		public function set currentScoreText(value:String):void
		{
			_currentScoreText = value;
			
			retolder.setTextInField(currentScoreLabel, _currentScoreText);
			
			layoutComponents();
		}

		
		private var _currentScoreValueText:String = "";

		/**
		 * 设置当前赢取的分数值
		 */
		public function get currentScoreValueText():String
		{
			return _currentScoreValueText;
		}

		/**
		 * @private
		 */
		public function set currentScoreValueText(value:String):void
		{
			_currentScoreValueText = value;
			
			retolder.setTextInField(currentScoreValueLabel, _currentScoreValueText);
			
			layoutComponents();
		}

		
		private var _roleImage:Object;

		/**
		 * 传入玩家头像 这必须是一个显示对象
		 */
		public function get roleImage():Object
		{
			return _roleImage;
		}

		/**
		 * @private
		 */
		public function set roleImage(value:Object):void
		{
			if(_roleImage)
			{
				retolder.removeChildToParent(_roleImage);
			}
			
			_roleImage = value;
			
			retolder.addChildToParent(roleImage, roleImageConatiner.mainContainer);
			
			layoutComponents();
		}
		
		

		
	}
}