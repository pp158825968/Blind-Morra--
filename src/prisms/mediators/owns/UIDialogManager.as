package prisms.mediators.owns
{
	import prisms.jars.UIKeysJar;
	import prisms.mediators.Arrester;
	import prisms.models.bases.BaseRetoldObject;
	import prisms.uis.dialogs.RoleDialog;
	
	/**
	 * 对话框组件管理类
	 */
	public class UIDialogManager extends BaseRetoldObject
	{
		/**
		 * 对话框组件管理类
		 */
		public function UIDialogManager()
		{
			super();
		}
		
		/**
		 * 玩家对话框
		 */
		public var playerDialog:RoleDialog;
		
		/**
		 * 准备在关卡显示玩家的头像框
		 */
		public function standardToPlayerDialog():RoleDialog
		{
			if(playerDialog) return playerDialog;
			
			playerDialog = new RoleDialog();
			
			playerDialog.scoreLabelText = Arrester.getLanguageText(UIKeysJar.SCORE);
			
			playerDialog.targetScoreLabelText = Arrester.getLanguageText(UIKeysJar.TARGET_SCORE);
			
			playerDialog.currentScoreText = Arrester.getLanguageText(UIKeysJar.CURRENT_SCORE);
			
			return playerDialog;
		}
	}
}