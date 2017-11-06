package prisms.models.bases
{
	import prisms.mediators.Arrester;
	
	import retolds.BusyRetolder;
	

	/**
	 * 带有retolder对象
	 * <br/>
	 * 这个retolder来源于Arrester
	 * <br/>
	 * 所以 Arrester的总初始化是很重要的
	 */
	public class BaseRetoldObject
	{
		
		/**
		 * 带有retolder对象
		 * <br/>
		 * 这个retolder来源于Arrester
		 * <br/>
		 * 所以 Arrester的总初始化是很重要的
		 */
		public function BaseRetoldObject()
		{
			_retolder = Arrester.retolder;
			// trace("_retolder " + _retolder);
		}
		
		private var _retolder:BusyRetolder;
		
		/**
		 * 接口翻译函数
		 */
		public function get retolder():BusyRetolder
		{
			return _retolder;
		}
		
		private var _name:String = "baseRetoldObject";

		/**
		 * 对象名字
		 */
		public function get name():String
		{
			return _name;
		}

		/**
		 * @private
		 */
		public function set name(value:String):void
		{
			_name = value;
		}

	}
}