package prisms.mediators.logics
{
	import prisms.mediators.Arrester;
	import prisms.mediators.owns.UITentsManager;
	

	/**
	 * ui交互逻辑管理部分
	 */
	public class UILogicManager
	{
		
		/**
		 * ui交互逻辑管理部分
		 */
		public function UILogicManager()
		{
			
		}
		
		/**
		 * 创建ui运行逻辑的管理类
		 */
		public function listenToUILogic():void
		{
			shipClickListener(Arrester.buttonManager.startButton, onStartButtonClick);
			
			shipClickListener(Arrester.buttonManager.overButton, onOverButtonClick);
			
			shipClickListener(Arrester.buttonManager.restartButton, onRestartButtonClick);
			
			shipClickListener(Arrester.buttonManager.pauseButton, onPauseButtonClick);
			
			shipClickListener(Arrester.buttonManager.knowButton, onKnowButtonClick);
			
			shipClickListener(Arrester.buttonManager.stillButton, onStillButtonClick);
			
			shipClickListener(Arrester.buttonManager.destructionButton, onDestructionButtonClick);
			
		}
		
		/**
		 * 封装一下点击事件
		 */
		private function shipClickListener(button:Object, handler:Function):void
		{
			Arrester.retolder.addEventListener(button, Arrester.retolder.click, handler, this);
		}
		
		/**
		 * 点击开始按钮 
		 * <br/>
		 * 进入到介绍幕
		 */
		protected function onStartButtonClick(event:Object):void
		{
			Arrester.retolder.removeChildToParent(
				Arrester.uiTentManager.titleTent.mainContainer);
			
			Arrester.uiTentManager.standardToIntroduceTent();
			
			Arrester.retolder.addChildToParent(
				Arrester.uiTentManager.introduceTent.mainContainer, Arrester.stage);
			
		}
		
		/**
		 * 点击结束按钮 
		 * <br/>
		 * 回到主标题幕
		 */
		protected function onOverButtonClick(event:Object):void
		{
			Arrester.retolder.addChildToParent(
				Arrester.uiTentManager.titleTent.mainContainer, Arrester.stage);
			
			Arrester.retolder.removeChildToParent(
				Arrester.uiTentManager.gameOverTent.mainContainer);
			
		}
		
		/**
		 * 点击重新开始按钮 
		 * <br/>
		 * 回到主标题幕
		 */
		protected function onRestartButtonClick(event:Object):void
		{
			Arrester.retolder.addChildToParent(
				Arrester.uiTentManager.titleTent.mainContainer, Arrester.stage);
			
			Arrester.retolder.removeChildToParent(
				Arrester.uiTentManager.allClearTent.mainContainer);
			
		}
		
		/**
		 * 点击介绍幕里面的知道按钮
		 * <br/>
		 * 进入到关卡幕/或者暂停幕当中
		 */
		protected function onKnowButtonClick(event:Object):void
		{
			if(Arrester.levelManager.levelTend && Arrester.levelManager.levelTend.isPlaying)
			{
				// 回到暂停幕
				Arrester.retolder.removeChildToParent(
					Arrester.uiTentManager.introduceTent.mainContainer);
			}
			else
			{
				// 首次进入到关卡
				Arrester.levelManager.standardToLevelTend();
				
				// 从第一关开始
				Arrester.levelManager.currentLevel = 1;
				
				Arrester.levelManager.gotoTheLevel(Arrester.levelManager.currentLevel);
			}
			
		}
		
		
		/**
		 * 点击暂停
		 * <br/>
		 * 暂时还没有暂停按钮2017年10月9日09:17:25
		 */
		protected function onPauseButtonClick(event:Object):void
		{
//			Arrester.tentManager.oprater.moveTentToCenter(Arrester.uiTentManager.titleTent.mainContainer,
//				{direction:TentDirection.RIGHT_UP_TO_LEFT_DOWN, isUsePosition:true});
//			
//			Arrester.tentManager.oprater.removeToTents(
//				Arrester.uiTentManager.allClearTent.mainContainer);
			
			Arrester.levelManager.levelTend.pause();
			
		}
		
		/**
		 * 点击取消暂停 回到关卡当中
		 * <br/>
		 */
		protected function onStillButtonClick(event:Object):void
		{
			Arrester.levelManager.levelTend.resumeLevel();
			
		}
		
		/**
		 * 在暂停幕中的介绍按钮 打开介绍
		 * <br/>
		 */
		protected function onDestructionButtonClick(event:Object):void
		{
			Arrester.retolder.addChildToParent(
				Arrester.uiTentManager.introduceTent.mainContainer, Arrester.stage);
			
		}
		
		
		
		
		
	}
}