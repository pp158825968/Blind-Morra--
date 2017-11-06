package flashes.rects
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.JointStyle;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	/**
	 * 带圆角和边框的矩形方块 - 默认情况下不显示边框和圆角
	 * @param w 宽
	 * @param h 高
	 * @param color 颜色
	 */  
	public class SampleWaneRect extends Sprite
	{
		private var bgW:Number = 100;
		private var bgH:Number = 100;
		
		private var _bgColor:uint;
		
		/**
		 * 带圆角和边框的矩形方块 - 默认情况下不显示边框和圆角
		 * <br/>
		 * 这个是内嵌式边框 和graphic的直接画法有不同
		 * @param w 宽
		 * @param h 高
		 * @param color 颜色
		 */ 
		public function SampleWaneRect(w:Number = 100, h:Number = 100, color:uint = 0xFF8600)
		{
			super();
			
			bgW = w;
			bgH = h;
			_bgColor = color;
			
			inits();
		}
		
		/**
		 * 初始化
		 */ 
		private function inits():void
		{
			drawGraph();
			
			addShapesToSatge();
		}
		
		/**
		 * 把图形放到舞台上面
		 */ 
		private function addShapesToSatge():void
		{
		}
		
		
		/**
		 * 完整的画出矩形轮廓 - 包括边框
		 */ 
		private function drawGraph():void
		{
			if(_isPowerSaving) return;
			
			var g:Graphics = this.graphics;
			g.clear();
			if(isBorderOn)
			{
				if(borderThickness >= bgW || borderThickness >= bgH)
				{
					// 边框太厚的话 就直接按边框的参数画一个矩形
					g.beginFill(borderColor, _fillAlpha);
					g.drawRoundRectComplex(0, 0, bgW, bgH, 
						topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
					g.endFill();
				}
				else
				{
					var borderRectWidth:Number = bgW - borderThickness; 
					var borderRectHeight:Number = bgH - borderThickness; 	
					
					var startX:Number = borderThickness * 0.5;
					var startY:Number = borderThickness * 0.5;
					
					g.lineStyle(borderThickness, borderColor, borderAlpha);
					
					if(isGradientOn)
					{
						patchGradients(g);
					}
					else
					{
						g.beginFill(_bgColor, _fillAlpha);
					}
					
					
					g.drawRoundRectComplex(startX, startY, borderRectWidth, borderRectHeight, 
						topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
					g.endFill();
				}
				
			}
			else
			{
				if(isGradientOn)
				{
					patchGradients(g);
				}
				else
				{
					g.beginFill(_bgColor, _fillAlpha);
				}
				g.drawRoundRectComplex(0, 0, bgW, bgH, 
					topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
				g.endFill();
			}
			
			
		}
		
		private var _roundRadius:Number = 0;
		
		/**
		 * 统一设置圆角半径
		 */
		public function get roundRadius():Number
		{
			return _roundRadius;
		}
		
		/**
		 * @private
		 */
		public function set roundRadius(value:Number):void
		{
			_roundRadius = value;
			
			topLeftRadius = value;
			topRightRadius= value;
			bottomLeftRadius = value;
			bottomRightRadius = value;
		}
		
		
		private var _topLeftRadius:Number = 0;
		
		/**
		 * 左上角圆角半径
		 */
		public function get topLeftRadius():Number
		{
			return _topLeftRadius;
		}
		
		/**
		 * @private
		 */
		public function set topLeftRadius(value:Number):void
		{
			_topLeftRadius = value;
			
			drawGraph();
		}
		
		
		private var _topRightRadius:Number = 0;
		
		/**
		 * 右上角圆角半径
		 */
		public function get topRightRadius():Number
		{
			return _topRightRadius;
		}
		
		/**
		 * @private
		 */
		public function set topRightRadius(value:Number):void
		{
			_topRightRadius = value;
			
			drawGraph();
		}
		
		
		private var _bottomLeftRadius:Number = 0;
		
		/**
		 * 左下角圆角半径
		 */
		public function get bottomLeftRadius():Number
		{
			return _bottomLeftRadius;
		}
		
		/**
		 * @private
		 */
		public function set bottomLeftRadius(value:Number):void
		{
			_bottomLeftRadius = value;
			
			drawGraph();
		}
		
		
		private var _bottomRightRadius:Number = 0;
		
		/**
		 * 右下角圆角半径
		 */
		public function get bottomRightRadius():Number
		{
			return _bottomRightRadius;
		}
		
		/**
		 * @private
		 */
		public function set bottomRightRadius(value:Number):void
		{
			_bottomRightRadius = value;
			
			drawGraph();
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
			if(isGradientOn) return;
			drawGraph();
		}
		
		private var _fillAlpha:Number = 1;
		
		/**
		 * 设置填充透明度
		 */ 
		public function set fillAlpha(value:Number):void
		{
			_fillAlpha = value;
			if(isGradientOn) return;
			drawGraph();
		}
		
		/**
		 * @private
		 */ 
		public function get fillAlpha():Number
		{
			return _fillAlpha;
		}
		
		override public function get height():Number
		{
			return bgH//super.height;
		}
		
		override public function set height(value:Number):void
		{
			// super.height = value;
			bgH = value;
			drawGraph();
			
		}
		
		override public function get width():Number
		{
			return bgW//super.width;
		}
		
		override public function set width(value:Number):void
		{
			// super.width = value;
			bgW = value;
			drawGraph();
			
		}
		
		private var _isBorderOn:Boolean = false;
		
		/**
		 * 是否显示边框
		 */
		public function get isBorderOn():Boolean
		{
			return _isBorderOn;
		}
		
		/**
		 * @private
		 */
		public function set isBorderOn(value:Boolean):void
		{
			_isBorderOn = value;
			
			drawGraph();
		}
		
		
		private var _borderColor:uint = 0xFFF000;
		
		/**
		 * 边框颜色
		 */
		public function get borderColor():uint
		{
			return _borderColor;
		}
		
		/**
		 * @private
		 */
		public function set borderColor(value:uint):void
		{
			_borderColor = value;
			
			drawGraph();
		}
		
		
		private var _borderThickness:Number = 1;
		
		/**
		 * 边框粗细
		 */
		public function get borderThickness():Number
		{
			return _borderThickness;
		}
		
		/**
		 * @private
		 */
		public function set borderThickness(value:Number):void
		{
			_borderThickness = value;
			
			drawGraph();
		}
		
		
		private var _borderAlpha:Number = 1;
		
		/**
		 * 边框透明度
		 */
		public function get borderAlpha():Number
		{
			return _borderAlpha;
		}
		
		/**
		 * @private
		 */
		public function set borderAlpha(value:Number):void
		{
			_borderAlpha = value;
			
			drawGraph();
		}
		
		
		/**
		 * 获取无边框效果下的内部宽度
		 */ 
		public function get innerRealWidth():Number
		{
			return isBorderOn ? width - borderThickness * 2 : width;
		}
		
		/**
		 * 获取无边框效果下的内部高度
		 */ 
		public function get innerRealHeight():Number
		{
			return isBorderOn ? height - borderThickness * 2 : height;
		}
		
		private var _isGradientOn:Boolean;
		
		/**
		 * 是否开启渐变模式
		 */
		public function get isGradientOn():Boolean
		{
			return _isGradientOn;
		}
		
		/**
		 * @private
		 */
		public function set isGradientOn(value:Boolean):void
		{
			_isGradientOn = value;
			
			if(gradientDataObject) drawGraph();
			
		}
		
		
		private var _gradientDataObject:Object;
		
		/**
		 * 渐变模式时使用的数据 可以不是
		 * <br/>
		 * 参数可以是一个Object对象但参数名字要与graphic的lineGradientStyle方法
		 * <br/>
		 * 例如这样{type:String, colors:Array, alphas:Array, ratios:Array, matrix:Matrix = null, spreadMethod:String = "pad", interpolationMethod:String = "rgb", focalPointRatio:Number = 0}	
		 * <br/>
		 * 注意类型不要写错
		 */ 
		public function get gradientDataObject():Object
		{
			return _gradientDataObject;
		}
		
		/**
		 * @private
		 */ 
		public function set gradientDataObject(value:Object):void
		{
			_gradientDataObject = value;
			
			if(isGradientOn)
			{
				drawGraph();
			}
		}
		
		/**
		 * 载入渐变参数
		 */ 
		private function patchGradients(gr:Graphics):void
		{
			if(!_gradientDataObject) return;
			
			// 渐变类型
			var type:String = _gradientDataObject.type ? _gradientDataObject.type : GradientType.LINEAR;
			
			// 颜色数组
			var colors:Array = _gradientDataObject.colors;
			
			// 透明度数组
			var alphas:Array = _gradientDataObject.alphas;
			
			for (var i:int = 0; i < alphas.length; i++) 
			{
				var TempAlpha:Number = alphas[i];
				TempAlpha = TempAlpha * fillAlpha;
				alphas[i] = TempAlpha;
			}
			
			
			// 颜色分布比率的数组
			var ratios:Array = _gradientDataObject.ratios;
			
			// 转换矩阵
			var matrix:Matrix = _gradientDataObject.matrix;
			
			// 指定spreadMethod值 使用SpreadMethod里的静态变量
			var spreadMethod:String = _gradientDataObject.spreadMethod;
			
			// InterpolationMethod 类中用于指定要使用的值的值
			var interpolationMethod:String = _gradientDataObject.interpolationMethod;
			
			// 一个控制渐变的焦点位置的数字
			var focalPointRatio:Number = _gradientDataObject.focalPointRatio;
			
			gr.beginGradientFill(type, colors, alphas, ratios, matrix, 
				spreadMethod, interpolationMethod, focalPointRatio);
			
		}
		
		private var _isPowerSaving:Boolean = false;

		/**
		 * 是否开启省电模式
		 * <br/>
		 * 在省电模式下 将不再进行绘制矩形图案 并将本实例的visible属性设置为false
		 * <br/>
		 * 在仅需要宽高值 不需要图形渲染的时候 可以将这个值设为false
		 */
		public function get isPowerSaving():Boolean
		{
			return _isPowerSaving;
		}

		/**
		 * @private
		 */
		public function set isPowerSaving(value:Boolean):void
		{
			_isPowerSaving = value;
			
			visible = !_isPowerSaving;
			
			drawGraph();
		}
		
		
	}
}
