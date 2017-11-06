package flashes.sounds
{
	import prisms.models.bases.BaseRetoldObject;
	import prisms.tools.ObjectPool;
	
	/**
	 * Flash环境下的声音播放工具类
	 * <br/>
	 * 重点还是在于mp3的播放设计
	 *//**
	* 声音播放管理类
	* <br/>
	* 主要作用就是初始化一个声音管理器
	*/
	public class SoundPlayer extends BaseRetoldObject
	{
		/**
		 * Flash环境下的声音播放工具类
		 * <br/>
	 	 * 重点还是在于mp3的播放设计
		 *//**
		* 声音播放管理类
		* <br/>
		* 主要作用就是初始化一个声音管理器
		*/
		public function SoundPlayer()
		{
			// 先响起来 鳴よう
			
			super();
			
			soundCache = retolder.getDictionaryFun();
			
			retolder.playSound = playSound;
		}
		
		/**
		 * 声音缓存对象
		 */
		private var soundCache:Object;
		
		//播放方法
		
		/**
		 * 播放音效
		 */
		public function playSound(soundURL:String, loops:int = 1, complete:Object = null, 
								  soundClass:Class = null, startTime:Number = 0):Object
		{
			// 先考虑播放吧 
			// 想那么久 也没见你想出啥好玩意
			
			if(!soundURL) return null;
			
			//实现声音的播放
			var soundBeam:SoundBeam = ObjectPool.getObject(SoundBeam);
			
			soundBeam.playSound(soundURL);
			
			//声道集合的建立
			var arr:Array = soundCache[soundURL];
			
			if(arr && arr.length > 0)
			{
				arr.push(soundBeam);
			}
			else
			{
				soundCache[soundURL] = [soundBeam];
			}
			
			return null;
		}
		
		/**
		 * 获取mp3文件的路径
		 */
		private function getSoundURL(soundName:String):String
		{
			var targetURL:String;
			
			return targetURL;
		}
		
		/**
		 * 停止播放音效
		 */ 
		public function stopAudio(audioName:String):void
		{
			//获取要停止的声道实例
			var arr:Array = soundCache[audioName];
			
			if(arr && arr.length > 0)
			{
				for (var i:int = 0; i < arr.length; i++) 
				{
					var soundBeam:SoundBeam = arr[i];
					
					soundBeam.stopSound();
					
					ObjectPool.recycle(soundBeam);
				}
			}
			
			//为了避免以后变量临时数组arr过多
			//每次停止播放之后 都去置空合集
			soundCache[audioName] = [];
		}
		
		
		
	}
}

		