package prisms.tools
{
	/**
	 * 提供一些处理字符串的方法
	 */
	public class TextsTool
	{
		/**
		 * 提供一些处理字符串的方法
		 */
		public function TextsTool()
		{
			
		}
		
		/**
		 * 将字符串里面的空格换成下划线
		 */
		public static function fillUnderLine(text:String):String
		{
			var result:String = text.replace(/ /gi, "_");
			
			return result;	
		}
		
	}
}