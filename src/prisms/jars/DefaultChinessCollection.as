package prisms.jars
{
	import prisms.mediators.Arrester;

	/**
	 * 在这里定义一下中文翻译的部分
	 * <br/>
	 * 现在语言键数量比较少 应该还不能和外部加载文本的做法相比
	 */
	public class DefaultChinessCollection
	{
		/**
		 * 在这里定义一下中文翻译的部分
		 * <br/>
		 * 现在语言键数量比较少 应该还不能和外部加载文本的做法相比
		 */
		public function DefaultChinessCollection()
		{
			inits();
		}
		
		/**
		 * 初始化 
		 */
		private function inits():void
		{
			defaultCollection = {};
			
			initKeys();
		}
		
		/**
		 * 给defaultCollection赋上相应的键值
		 */
		private function initKeys():void
		{
			LanguageJar.initKeys();
			UIKeysJar.initKeys();
			QuizJar.initKeys();
			
			initWords();
			
			var key:String;
			
			var arr:Array = LanguageJar.languageKeys.concat(UIKeysJar.languageKeys);
			
			arr = arr.concat(QuizJar.languageKeys);
			
			for each (key in arr) 
			{
				defaultCollection[key] = this.hasOwnProperty(key) ? this[key] : key;
			}
			
		}
		
		
		
		/**
		 * 存放多语言数据的对象
		 * <br/>
		 * 可以根据指定的键 在这里获取文本内容
		 */
		private var defaultCollection:Object;
		
		/**
		 * 根据指定的键 获取一个文本
		 */
		public function getLanguageText(langKey:String, defaultText:String = ""):String
		{
//			return defaultCollection.hasOwnProperty(langKey) ?
//				defaultCollection[langKey] : defaultText;
			
			return hasOwnProperty(langKey) ?
				this[langKey] : defaultText;
		}
		
		// 定义定义
		
		/**
		 * 进度
		 */
		public var progress:String = "进度";
		
		/**
		 * 关卡
		 */
		public var level:String = "关卡";
		
		/**
		 * 操作介绍说明
		 */
		public var introduce:String = "点击相应的鼠标选项即可 剩下的就是 不要被假象蒙蔽了双眼";
		
		/**
		 * 暂停中
		 */
		public var pausing:String = "暂停中";
		
		/**
		 * 玩家血量
		 */
		public var hp:String = "血量";
		
		/**
		 * 玩家技能冷却时间
		 */
		public var cd:String = "冷却";
		
		/**
		 * 开始
		 */
		public var start:String = "开始";
		
		/**
		 * 结束
		 */
		public var over:String = "结束";
		
		/**
		 * 重新开始
		 */
		public var restart:String = "重新开始";
		
		/**
		 * 知道了
		 */
		public var know:String = "知道了";
		
		/**
		 * 暂停
		 */
		public var pause:String = "暂停";
		
		/**
		 * 继续游戏
		 */
		public var still:String = "继续游戏";
		
		/**
		 * 继续游戏
		 */
		public var destruction:String = "继续游戏";
		
		/**
		 * 继续游戏
		 */
		public var all_in:String = "All IN!";
		
		/**
		 * 分数
		 */
		public var score:String = "你的分数";
		
		/**
		 * 猜拳选项卡中的提问
		 */
		public var morra_quiz:String = "包剪锤押一个 买定离手";
		
		/**
		 * 下注选项卡中的提问
		 */
		public var bets_quiz:String = "你很有自信的说 那就给你出的拳 下个注吧";
		
		/**
		 * 下注选项卡中的怂恿提示
		 */
		public var bet_all_in_1:String = "留给你的选项好像不多了";
		
		
		
		/**
		 * 石头
		 */
		public var rock:String = "锤";
		
		/**
		 * 剪刀
		 */
		public var scissor:String = "剪"; 
		
		/**
		 * 布
		 */
		public var paper:String = "包";
		
		
		// 你的包战胜了我的锤
		// 君の鋏が石に負けちゃった
		// 如果其他语言的话 表述之类的就是个问题
		
		/**
		 * 胜
		 */
		public var win:String = "战胜了";
		
		/**
		 * 平
		 */
		public var drawn:String = "打平了";
		
		/**
		 * 负
		 */
		public var lose:String = "输给了";
		
		/**
		 * 玩家称呼
		 */
		public var player_name:String = "你的";
		
		/**
		 * 电脑称呼
		 */
		public var computer_name:String = "我的";
		
		// 三信♂
		
		/**
		 * 鼓励 - 胜利提示
		 */
		public var win_tip:String = "你做得很不错嘛";
		
		/**
		 * 冷静 - 打平提示
		 */
		public var drawn_tip:String = "这也是没办法的事情啊";
		
		/**
		 * 嘲讽 - 失败提示
		 */
		public var lose_tip:String = "你做得还不够好啊";
		
		/**
		 * 过关提示
		 */
		public var level_clear:String = "过关";
		
		/**
		 * 闯关失败提示
		 */
		public var level_over:String = "充钱能变强";
		
		/**
		 * 继续停留在关卡中
		 */
		public var level_continue:String = "继续挑战";
		
		/**
		 * 玩家过关时所需要的分数
		 */
		public var target_score:String = "目标净胜分数";
		
		/**
		 * 玩家当前赢得的分数
		 */
		public var current_score:String = "你赢到的分数";
		
		/**
		 * 左右摇摆中
		 * <br/>
		 * 摇奖中
		 */
		public var guessing:String = "左右摇摆中";
		
		/**
		 * 充值按钮
		 */
		public var priceless:String = "快来充值";
		
		/**
		 * 拒绝充值按钮
		 */
		public var cheap:String = "不充";
		
		/**
		 * 充值失败
		 */
		public var price_fail:String = "充值失败,看在你愿意充值的份上 给点内幕你吧";
		
		/**
		 * 拒绝充值之后的嘲讽
		 */
		public var cheap_chop:String = "你个小气鬼";
		
		/**
		 * 点击"？"
		 */
		public var quiz_cilck:String = "点击问号 偷看结果";
		
		/**
		 * 坚信按钮
		 */
		public var believe:String = "相信自己";
		
		/**
		 * 后悔按钮
		 */
		public var repent:String = "后悔";
		
		/**
		 * 逆转倍数提示
		 */
		public var win_best_tip:String = "*这把奖励为1赔{#1} 这盘取胜你将获得{#2}分";
		
		/**
		 * 为键值peek_tips准备的数组
		 */
		private var peekTips:Array;
		
		/**
		 * 为键值repent_tips准备的数组
		 */
		private var repentTips:Array;
		
		
		
		/**
		 * 创建一些放满字符串的数组 供getter使用
		 */
		private function initWords():void
		{
			peekTips = [
				"嘿面 留给中国队的时间已经不多了 你要逆转一把吗",
				"留给你的选项好像不多了...",
				"我感觉待会你会输 但天无绝人之路,而且充钱就能变强...",
				"兄弟 翻盘的机会来了 剩下的就看你...意思意思",
				"那个'?'就是为了此刻 真是千载难逢啊",
				"付出才会赢 就这么简单"
			];
			
			repentTips = [
				"看来你已经发现了什么 后悔只能趁现在哦",
				"你好像知道了什么 充钱的好处就在这里",
				"现在 你确定不改变出拳吗 即使是这样",
				"坚信自己所看到的一切 对吧",
				"有时 你会认为自己会被幻觉所蒙蔽双眼吗"
			];
		}
		
		/**
		 * 怂恿偷看的提示
		 * <br/>
		 * 注意 这里是随机获取一条的
		 */
		public function get peek_tips():String
		{
			var index:int =  
				Arrester.retolder.parseToInt(Arrester.retolder.random() * peekTips.length);
			
			return peekTips[index];
		}
		
		/**
		 * 怂恿改变下注的提示
		 * <br/>
		 * 注意 这里是随机获取一条的
		 */
		public function get repent_tips():String
		{
			var index:int = 
				Arrester.retolder.parseToInt(Arrester.retolder.random() * repentTips.length);
				
			
			return repentTips[index];
		}
		
	}
}