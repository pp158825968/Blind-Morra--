package prisms.tools
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import prisms.mediators.Arrester;

	/**
	 * 图形加载工具
	 */
	public class ImageLoadTools
	{
		/**
		 * 图形加载工具
		 */
		public function ImageLoadTools()
		{
			
		}
		
		/**
		 * 设定加载方法
		 */
		public static function doSetting(envirment:String):void
		{
			
		}
		
		
		
		/**
		 * 加载器
		 */
		private static var loader:Loader;
		
		/**
		 * 位图数据缓存字典
		 */
		private static var bitmapDic:Dictionary = new Dictionary();
		
		/**
		 * 在flash的环境中加载图片
		 */
		public static function loadInFlash(bitmap:Bitmap, url:String):void
		{
			if(bitmapDic[url]) 
			{
				bitmap.bitmapData = bitmapDic[url];
			}
			else
			{
				insertInLoad(bitmap, url);
			}
		}
		
		/**
		 * 当前加载的链接
		 */
		private static var currentLoadUrl:String;
		
		
		/**
		 * 临时加载队列
		 */
		private static var tempLoads:Array = []; 
		
		/**
		 * 加载图片 并且按照顺序
		 */
		private static function insertInLoad(bitmap:Bitmap, url:String):void
		{
			if(!loader)
			{
				loader = new Loader();
				
			}
			
			var isRepeat:Boolean = false;
			
			for each (var tempObject:Object in tempLoads) 
			{
				if(tempObject.url == url)
				{
					isRepeat = true;
				}
			}
			
			if(!isRepeat) tempLoads.push({bitmap: bitmap, url: url});
			
			if(!currentLoadUrl)
			{
				currentLoadUrl = url;
				
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
				
				loader.load(new URLRequest(currentLoadUrl));
			}
			
			/**
			 * 完成时 图片将得到bitmapData 然后开始加载下个链接
			 */
			function onComplete(event:Event):void
			{
				var bd:BitmapData = new BitmapData(loader.width, loader.height, true, 0x0);
				
				bd.draw(loader);
				
				bitmapDic[currentLoadUrl] = bd;
				
				// 更新位图引用
				var currentLoadObject:Object;
				
				for (var i:int = 0; i < tempLoads.length; i++) 
				{
					var currentTempObject:Object = tempLoads[i];
					
					if(currentTempObject.url == currentLoadUrl)
					{
						currentTempObject.bitmap.bitmapData = bd;
						
						var nextObject:Object = tempLoads[i + 1];
						
						tempLoads.splice(i, 1);
						
						if(nextObject)
						{
							currentLoadUrl = null;
							
							insertInLoad(nextObject.bitmap, nextObject.url);
						}
						
						break;
					}
					
					// 加载下一个链接
				}
				
				
			}
		}
		
		/**
		 * 找出指定路径下对应的缓存
		 * <br/>
		 * 一般直接缓存成bitmapData数据
		 */
		public static function getLoadedData(url:String):Object
		{
			return bitmapDic[url];
		}
		
		/**
		 * 缓存所有加载过的url
		 */
		private static var loadUrls:Array = [];
		
		/**
		 * 当前加载中的url数组
		 */
		private static var tempLoadingUrls:Array;
		
		/**
		 * 加载一组图片路径 并将图片缓存起来
		 */
		public static function loadURLs(urls:Array, 
			loading:Function, loadComplete:Function, isGrainStyle:Boolean = false):void
		{
			if(urls) loadUrls.concat(urls);
			
			if(!currentLoadUrl)
			{
				for each (var url:String in loadUrls) 
				{
					if(!bitmapDic[url])
					{
						currentLoadUrl = url;
						break;
					}
				}
				
				if(!currentLoadUrl) 
				{
					loadComplete();
					return;
				}
				
				if(!loader) loader = new Loader();
				
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
				
				loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
				
				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
				
//				var tempURL:String = isGrainStyle ?
//					Arrester.grainManager.gitGrainURL(currentLoadUrl) : currentLoadUrl;
				
				var tempURL:String = currentLoadUrl;
				
				loader.load(new URLRequest(tempURL));
			}
			
			/**
			 * 加载错误
			 */
			function onIOError(event:IOErrorEvent):void
			{
				trace("IO Error " + event.type);
			}
			
			/**
			 * 完成时 图片将得到bitmapData 然后开始加载下个链接
			 */
			function onComplete(event:Event):void
			{
				var bd:BitmapData = new BitmapData(loader.width, loader.height, true, 0x0);
				
				bd.draw(loader);
				
				bitmapDic[currentLoadUrl] = bd;
				
				var index:int = loadUrls.indexOf(currentLoadUrl);
				
				if(index > -1) loadUrls.splice(index, 1);
				
				currentLoadUrl = null;
				
				if(loadUrls.length > 0)
				{
					loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
					
					loadURLs(null, loading, loadComplete, isGrainStyle);
				}
				else
				{
					if(loadComplete != null) 
					{
						trace("on complete");
						loadComplete();
					}
				}
				
			}
			
			/**
			 * 加载中
			 */
			function onProgress(event:ProgressEvent):void
			{
				var percent:Number = event.bytesLoaded / event.bytesLoaded;
				
				if(loading != null) loading(percent);
			}
			
		}
			
		
	}
}