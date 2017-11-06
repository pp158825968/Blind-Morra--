package prisms.mediators.owns
{
	import prisms.models.bases.BaseRetoldObject;
	import prisms.views.quizes.BaseQuiz;
	import prisms.views.quizes.BetsQuiz;
	import prisms.views.quizes.FactQuiz;
	import prisms.views.quizes.GuessQuiz;
	import prisms.views.quizes.MorraQuiz;
	import prisms.views.quizes.ResultQuiz;
	
	/**
	 * 问答选项卡管理器
	 * <br/>
	 * 负责创建各种选项卡
	 */
	public class QuizManager extends BaseRetoldObject
	{
		
		/**
		 * 问答选项卡管理器
		 * <br/>
		 * 负责创建各种选项卡
		 */
		public function QuizManager()
		{
			super();
			
			initColors();
		}
		
		/**
		 * 配色
		 */
		private function initColors():void
		{
			morraQuizColor = 0x33D99D;
			factQuizColor = 0xDDBBAA;
			betsQuizColor = 0xDD6699;
			resultQuizColor = 0x99DD66;
			guessQuizColor = 0x66AADD;
		}
		
		/**
		 * 猜拳选项卡
		 * <br/>
		 * 包剪锤 买定离手
		 */
		public var morraQuiz:MorraQuiz;
		
		/**
		 * 颜色
		 */
		public var morraQuizColor:uint;
		
		/**
		 * 创建猜拳选项卡
		 */
		public function standardToMorraQuiz():MorraQuiz
		{
			morraQuiz = new MorraQuiz(morraQuizColor);
			
			return morraQuiz;
		}
		
		/**
		 * 实时选项卡
		 * <br/>
		 * 实时反馈游戏进行的选项卡
		 */
		public var factQuiz:FactQuiz;
		
		/**
		 * 颜色
		 */
		public var factQuizColor:uint;
		
		/**
		 * 创建实时选项卡
		 */
		public function standardToFactQuiz():FactQuiz
		{
			factQuiz = new FactQuiz(factQuizColor);
			
			return factQuiz;
		}
		
		/**
		 * 下注选项卡
		 * <br/>
		 * 实时反馈游戏进行的选项卡
		 */
		public var betsQuiz:BetsQuiz;
		
		/**
		 * 颜色
		 */
		public var betsQuizColor:uint;
		
		/**
		 * 创建实时选项卡
		 */
		public function standardToBetsQuiz():BetsQuiz
		{
			betsQuiz = new BetsQuiz(betsQuizColor);
			
			return betsQuiz;
		}
		
		/**
		 * 结果选项卡
		 * <br/>
		 * 公布最后的猜拳结果
		 */
		public var resultQuiz:ResultQuiz;
		
		/**
		 * 颜色
		 */
		public var resultQuizColor:uint;
		
		/**
		 * 创建结果选项卡
		 */
		public function standardToResultQuiz():ResultQuiz
		{
			resultQuiz = new ResultQuiz(resultQuizColor);
			
			return resultQuiz;
		}
		
		/**
		 * 摇奖选项卡
		 * <br/>
		 * 充钱才能变强
		 */
		public var guessQuiz:GuessQuiz;
		
		/**
		 * 颜色
		 */
		public var guessQuizColor:uint;
		
		/**
		 * 创建摇奖选项卡
		 */
		public function standardToGuessQuiz():GuessQuiz
		{
			guessQuiz = new GuessQuiz(guessQuizColor);
			
			return guessQuiz;
		}
		
	}
}