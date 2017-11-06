package layas.rects
{
	import laya.display.Graphics;
	import laya.display.Sprite;
	import laya.maths.Rectangle;
	
	/**
	 * 仅仅是一个矩形方块
	 * @author 李文浩_2505164669 ~孤岛之花~
	 * @Email:2505164669@qq.com
	 */ 
	public class LitaRect extends Sprite
	{
		private var bgW:Number = 10;
		private var bgH:Number = 10;
		
		private var g:Graphics;
		
		private var _bgColor:uint;
		
		/**
		 * 可点击区域
		 */
		private var hitAreaRectangle:Rectangle;
		
		
		/**
		 * 仅仅是一个矩形方块
		 * @param w 宽
		 * @param h 高
		 * @param color 颜色
		 */ 
		public function LitaRect(w:Number, h:Number, rectColor:uint = 0xFF8600)
		{
			super();
			
			// 要注册点击事件 必须设置mouseEnable为true
//			mouseEnabled = true
			
			this.g = graphics;
			bgW = w;
			bgH = h;
			_bgColor = rectColor;
			
			
			
			drawBg();
		}
		
		
		
		private function drawBg():void
		{
			g.clear();
			
			var tempColor:String = "#" + _bgColor.toString(16);
			
			g.drawRect(0, 0, bgW, bgH, tempColor);
			
			if(!hitAreaRectangle)
			{
				hitAreaRectangle = new Rectangle(0, 0, bgW, bgH);
				hitArea = hitAreaRectangle;
			}
			else
			{
				hitAreaRectangle.width = bgW;
				hitAreaRectangle.height = bgH;
			}
			
		}
		

		/**
		 * 设置颜色
		 */
		public function get color():uint
		{
			return _bgColor;
		}

		/**
		 * @private
		 */
		public function set color(value:uint):void
		{
			_bgColor = value;
			
			drawBg();
		}
		
		private var _fillAlpha:Number = 1;
		
		/**
		 * 设置填充透明度
		 */ 
		public function get fillAlpha():Number
		{
			return _fillAlpha;
		}
		
		/**
		 * 设置填充透明度
		 */ 
		public function set fillAlpha(value:Number):void
		{
			_fillAlpha = value;
			
			drawBg();
		}
		
		/**
		 * 当visible设为false的实时 不在对宽高改变时进行拉伸渲染 仅作为宽高值参照的话 可以考虑设置为false
		 * <br/>
		 * 但是如果该矩形作为容器的话 则不适合这么做 
		 */ 
		override public function set visible(value:Boolean):void
		{
			// 当visible设为false的实时 不在对宽高改变时进行拉伸渲染
			if(!value)
			{
				bgH = this.height;
				bgW = this.width;
			}
			
			super.visible = value;
			
			
		}
		
		override public function get height():Number
		{
			return bgH;
		}
		
		override public function set height(value:Number):void
		{
			bgH = value;
			
			if(visible)
			{
				super.height = value;
			}
			
			drawBg();
		}
		
		override public function get width():Number
		{
			return bgW;
		}
		
		override public function set width(value:Number):void
		{
			bgW = value;
			
			if(visible)
			{
				super.width = value;
					
			}
			
			drawBg();
			
		}
		
		
		
		

	}
}