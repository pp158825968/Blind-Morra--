package prisms.mediators
{
	import prisms.jars.DefaultChinessCollection;
	import prisms.mediators.logics.LevelManager;
	import prisms.mediators.logics.NouManager;
	import prisms.mediators.logics.UILogicManager;
	import prisms.mediators.logics.XaviManager;
	import prisms.mediators.owns.QuizManager;
	import prisms.mediators.owns.UIButtonsManager;
	import prisms.mediators.owns.UIDialogManager;
	import prisms.mediators.owns.UITentsManager;
	import prisms.mediators.owns.VisualManager;
	
	import retolds.BusyRetolder;
	

	/**
	 * 拘束器
	 * <br/>
	 * 分部系统管理器
	 */
	public class Arrester
	{
		/**
		 * 拘束器
		 * <br/>
		 * 分部系统管理器
		 */
		public function Arrester()
		{
			
		}
		
		/**
		 * 引擎api兼容翻译器
		 */
		public static var retolder:BusyRetolder;
		
		/**
		 * 主要逻辑管理类
		 */
		public static var nouManager:NouManager;
		
		/**
		 * 游戏操作逻辑类的实例
		 */
		public static var xavi:XaviManager;
		
		private static var _stage:Object;
		
		/**
		 * 角度转弧度 转换系数
		 */
		public static var PR:Number;
		
		/**
		 * 测试函数数组
		 */
		public static var frameFuns:Array = [];
		
		/**
		 * 游戏场景宽度
		 */
		public static var senceWidth:Number = 800;
		
		/**
		 * 游戏场景高度
		 */
		public static var senceHeight:Number = 450;
		
		/**
		 * 关卡管理器
		 */
		public static var levelManager:LevelManager;
		
		
		/**
		 * 场景创建管理器
		 */
		public static var uiTentManager:UITentsManager;
		
		/**
		 * 内部视图管理器
		 */
		public static var visualManager:VisualManager;
		
		/**
		 * 加载图片方法的引用
		 */
		public static var loadURLs:Function;
		
		/**
		 * 根据url路径查找位图缓存的方法
		 */
		public static var getLoadedData:Function;
		
		/**
		 * 镜头中心的x坐标点
		 */
		public static var cameraCenterX:Number;
		
		/**
		 * 镜头中心的x坐标点
		 */
		public static var cameraCenterY:Number;
		
		/**
		 * 按钮管理器
		 */
		public static var buttonManager:UIButtonsManager;
		
		/**
		 * ui部分逻辑类的实例
		 */
		public static var uiLogic:UILogicManager;
		
		/**
		 * 多语言文本数据部分
		 */
		public static var languageCollection:Object;
		
		/**
		 * 对话管理器
		 */
		public static var dialogManager:UIDialogManager;
		
		/**
		 * 问答选项卡管理器
		 */
		public static var quizManager:QuizManager;
		
		/**
		 * 注入分部管理组件
		 */
		public static function injectToManager(inject:Object):void
		{
			retolder = getInject(inject, "retolder", BusyRetolder) as BusyRetolder;
			
			PR = retolder.PI / 180;
			
			cameraCenterX = senceWidth * 0.5;
			
			cameraCenterY = senceHeight * 0.5;
			
			retolder.stage = stage;
			
			levelManager = new LevelManager();
			
			nouManager = new NouManager();
			
	 		xavi = new XaviManager();
			
			uiTentManager = new UITentsManager();
			
			uiLogic = new UILogicManager();
			
			languageCollection = new DefaultChinessCollection();
			
			buttonManager = new UIButtonsManager();
			
			dialogManager = new UIDialogManager();
			
			quizManager = new QuizManager();
			
			visualManager = new VisualManager();
			
		}
		
		
		/**
		 * 字段识别来创建管理类实例
		 */
		private static function getInject(inject:Object, property:String, DefaultManager:Class):Object
		{
			if(inject && inject[property])
			{
				return new inject[property]();
			}
			
			return new DefaultManager();
		}
		
		/**
		 * 根据字段名 获取该字段当前语境下的多语言文本
		 */
		public static function getLanguageText(langKey:String, defaultText:String = ""):String
		{
			// return nouManager.gameData.getLanguageText(langKey, defaultText);
			return languageCollection.getLanguageText(langKey, defaultText);
			
		}
		
		/**
		 * 舞台引用
		 */
		public static function get stage():Object
		{
			return _stage;
		}
		
		/**
		 * @private
		 */
		public static function set stage(value:Object):void
		{
			_stage = value;
			
			nouManager.stage = stage;
		}
		
		
		
	}
}