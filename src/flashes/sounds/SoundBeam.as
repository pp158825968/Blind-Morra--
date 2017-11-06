package flashes.sounds
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;

	/**
	 * 单个声音文件的控制播放类
	 * <br/>
	 * 主要就是为了方便粒子池的回收
	 */
	public class SoundBeam
	{
		/**
		 * 单个声音文件的控制播放类
		 */
		public function SoundBeam()
		{
			inits();
		}
		
		/**
		 * 声音实例
		 */
		private var sound:Sound;
		
		private var _channel:SoundChannel;

		
		/**
		 * 初始化
		 */
		public function inits():void
		{
			initSound();
			
			initListeners();
		}
		
		/**
		 * 初始化声音实例
		 */
		public function initSound():void
		{
			sound = new Sound();
		}
		
		/**
		 * 注册相关的声音事件
		 */
		public function initListeners():void
		{
			
		}
		
		/**
		 * 播放音效
		 */
		public function playSound(soundName:String, loops:int = 1, complete:Object = null, 
								  soundClass:Class = null, startTime:Number = 0):Object
		{
			if(!sound.url || sound.url == soundName)
			{
				sound.load(new URLRequest(soundName));
			}
			
			var sc:SoundChannel = sound.play();
			
			if(sc) sc.addEventListener(Event.SOUND_COMPLETE, onComplete);
			
			return sc;
			
			/**
			 * 声音播放完毕之后要做的事情
			 */
			function onComplete(event:Event):void
			{
				event.target.removeEventListener(Event.SOUND_COMPLETE, onComplete);
				
				if(complete != null) complete();
			}
			
		}
		
		
		/**
		 * 声道实例
		 */
		public function get channel():SoundChannel
		{
			return _channel;
		}
		
		/**
		 * 停止声音播放
		 */
		public function stopSound():void
		{
			if(!_channel) return;
			
			_channel.stop();
			
		}
		
	}
}