package retolds.subs
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	
	import caurina.transitions.Tweener;
	
	import retolds.BusyRetolder;
	
	/**
	 * 针对FLash环境下的一般接口翻译
	 */
	public class FlashRetolder extends BusyRetolder
	{
		/**
		 * 针对FLash环境下的一般接口翻译
		 */
		public function FlashRetolder()
		{
			super();
			
			inits();
		}
		
		/**
		 * 总初始化
		 * <br/>
		 * 开始给父类的函数变量们赋值了
		 */
		protected function inits():void
		{
			versionName = "Version BM-0.0.3-Flash";
			
			hasParent = reloldHasParent;
			
			addChildToParent = reloadAddChildToParent;
			
			removeChildToParent = reloadRemoveChildToParent;
			
			setChildIndex = reloadSetChildIndex;
			
			tweenTo = reloadTweenTo;
			
			tween = reloadTween;
			
			tweenGeen = reloadTweenGeen;
			
			removeTweenTo = reloadRemoveTweenTo;
			
			getWidth = reloadGetWidth;
			
			getHeight = reloadGetHeight;
			
			getSprite = reloadGetSprite;
			
			getShape = reloadGetShape;
			
			getEventDispatcher = reloadGetEventDispatcher;
			
			dispatchEvent = reloadDispatchEvent;
			
			addEventListener = reloadAddEventListener;
			
			removeEventListener = reloadRemoveEventListener;
			
			
			
			getRectangle = reloadGetRectangle;
			
			addMask = reloadAddMask;
			
			getMouseX = reloadGetMouseX;
			
			getMouseY = reloadGetMouseY;
			
			startDrag = reloadStartDrag;
			
			stopDrag = reloadStopDrag;
			
			hitTestFun = reloadHitTest;
			
			hitInRect = reloadHitInRect;
			
			getHitRect = reloadGetHitRect;
			
//			hitTestFun = reloadHitInDistance;
			
			drawPolygonFun = reloadDrawPolygon;
			
			getKeyCode = reloadGetKeyCode;
			
			insertGrainFun = reloadInsertGrain;
			
			getGrainViewerFun = reloadGetGrainViewer;
			
			getGlobalPosition = reloadGetGlobalPosition;
			
			removeFromArray = reloadRemoveFromArray;
			
			distance = reloadDistance;
			
			getDictionaryFun = reloadGetDictionary;
			
			parseToInt = reloadParseInt;
			
			getRandomObjectInArray = reloadGetRandomObjectInArray;
			
			setMouseRange = reSetMouseRange;
			
			// 数学方法
			sqrt = Math.sqrt;
			
			sin = Math.sin;
			
			cos = Math.cos;
			
			tan = Math.tan;
			
			atan2 = Math.atan2;
			
			acos = Math.acos;
			
			min = Math.min;
			
			max = Math.max;
			
			round = Math.round;
			
			ceil = Math.ceil;
			
			random = Math.random;
			
			abs = Math.abs;
			
			PI = Math.PI;
			
			
			// 事件字符串
			click = MouseEvent.CLICK;
			
			mouse_down = MouseEvent.MOUSE_DOWN;
			
			mouse_move = MouseEvent.MOUSE_MOVE;
			
			mouse_up = MouseEvent.MOUSE_UP;
			
			key_up = KeyboardEvent.KEY_UP;
			
			key_down = KeyboardEvent.KEY_DOWN;
			
			added_to_stage = Event.ADDED_TO_STAGE;
			
			remove_from_stage = Event.REMOVED_FROM_STAGE;
			
			// 键位码
			keycode_up = Keyboard.UP;
			keycode_down = Keyboard.DOWN;
			keycode_left = Keyboard.LEFT;
			keycode_right = Keyboard.RIGHT;
			
			keycode_up_w = Keyboard.W;
			keycode_down_s = Keyboard.S;
			keycode_left_a = Keyboard.A;
			keycode_right_d = Keyboard.D;
			
			keycode_fire = Keyboard.J;
			keycode_skill = Keyboard.K;
			
			// 设置文本框
			getTextField = reloadGetTextField;
			
			setTextField = reloadSetTextField;
			
			setTextInField = reloadSetTextInField;
			
		}
		
		/**
		 * 从数组里随机取出一个对象
		 */
		private function reloadGetRandomObjectInArray(arr:Array):Object
		{
			var index:int = arr.length * random();
			
			return arr[index];
		}
		
		/**
		 * 将参数的值转成int值
		 * <br/>
		 * 因为int()方法在Laya里面无效
		 */
		private function reloadParseInt(value:Object):int
		{
			return int(value);
		}
		
		/**
		 * 获取字典对象
		 */
		private function reloadGetDictionary():Object
		{
			return new Dictionary();
		}
		
		/**
		 * 计算距离
		 */
		private function reloadDistance(p1:Object, p2:Object):Number
		{
			var newP1:Point = new Point(p1.x, p1.y);
			var newP2:Point = new Point(p2.x, p2.y);
			
			return Point.distance(newP1, newP2);
		}		
		
		
		/**
		 * 获取一个能显示纹理的对象
		 * <br/>
		 * 在flash里面就是bitmap了
		 */
		private function reloadGetGrainViewer():Object
		{
			return new Bitmap();
		}
		
		/**
		 * 将纹理放入到位图显示
		 */
		private function reloadInsertGrain(bitmap:Bitmap, bitmapData:BitmapData):void
		{
			bitmap.bitmapData = bitmapData;
		}		
				
		
		/**
		 * 获取键盘事件里面的键位码
		 */
		private function reloadGetKeyCode(event:KeyboardEvent):Object
		{
			return event.keyCode;
		}
		
		/**
		 * 创建一个新的Shape对象
		 */
		private function reloadGetShape():Shape
		{
			return new Shape();
		}
		
		/**
		 * 画出多边形
		 */
		private function reloadDrawPolygon(graphicsObject:Object, points:Array, styleObject:Object = null):void
		{
			var g:Graphics = graphicsObject.graphics as Graphics;
			styleObject = styleObject 
				|| {isAllClear:false, isClear: true, 
					isLineStyle:true, fillColor:0x88FF66, lineColor:0x0};
			
			if(styleObject.isAllClear)
			{
				g.clear();
				return;
			}
			
			var fillAlpha:Number = styleObject.fillAlpha || 1;
			var lineAlpha:Number = styleObject.lineAlpha || 1;
			var thickness:Number = styleObject.thickness || 0.5;
			
			var fillColor:uint = styleObject.fillColor //|| 0x88FF66;
			var lineColor:uint = styleObject.lineColor //|| 0x0;
			
			var isClear:Boolean = styleObject.isClear;
			var isLineStyle:Boolean = styleObject.isLineStyle;
			
			if(isClear) g.clear();
//			if(isLineStyle) g.lineStyle(thickness, lineColor, lineAlpha);
			g.lineStyle(thickness, lineColor, lineAlpha);
			g.beginFill(fillColor, fillAlpha);
			g.moveTo(points[0].x, points[0].y);
			
			for (var i:int = 1; i < points.length; i++) 
			{
				g.lineTo(points[i].x, points[i].y);
//				trace("points[i].x " + points[i].x, " points[i].y " + points[i].y);
			}
			
			g.lineTo(points[0].x, points[0].y);
			g.endFill();
			
		}
		
		/**
		 * 通过距离来进行碰撞检测
		 */
		private function reloadHitInDistance(currentObject:Object, hitObject:Object):void
		{
			
		}
		
		/**
		 * 碰撞检测函数
		 */
		private function reloadHitTest(currentObject:Object, hitObject:Object):Boolean
		{
			return DisplayObject(currentObject).hitTestObject(hitObject as DisplayObject);
		}
		
		/**
		 * 碰撞检测函数 - 以矩形作为检测对象
		 */
		private function reloadHitInRect(rectA:Rectangle, rectB:Rectangle):Boolean
		{
			return rectA.intersects(rectB);
		}
		
		/**
		 * 获取香蕉矩形
		 */
		private function reloadGetHitRect(rectA:Rectangle, rectB:Rectangle):Rectangle
		{
			return rectA.intersection(rectB);
		}
		
		
		/**
		 * 停止对显示对象的拖拽
		 */
		private function reloadStopDrag(object:Sprite):void
		{
			object.stopDrag();
		}
		
		/**
		 * 显示对象的拖拽功能
		 */
		private function reloadStartDrag(object:Sprite, lockCenter:Boolean = false, bounds:Rectangle = null):void
		{
			object.startDrag(lockCenter, bounds);
		}
		
		/**
		 * 获取对象的鼠标y
		 */
		private function reloadGetMouseY(object:Object):Number
		{
			return object["mouseY"];
		}
		
		/**
		 * 获取对象的鼠标x
		 */
		private function reloadGetMouseX(object:Object):Number
		{
			return object["mouseX"];
		}
		
		/**
		 * 给显示对象加上遮罩
		 */
		private function reloadAddMask(displayObject:DisplayObject, 
									   maskObject:DisplayObject, showContainer:DisplayObjectContainer):void
		{
			displayObject.mask = maskObject;
			
			// 这个就得注意了
			addChildToParent(maskObject, showContainer);
		}
		
		
		
		/**
		 * 获取几何意义上的方块
		 */
		private function reloadGetRectangle(x:Number, y:Number, w:Number, h:Number):Rectangle
		{
			return new Rectangle(x, y, w, h);
			
		}
		
		/**
		 * 移除侦听器
		 */
		private function reloadRemoveEventListener(dispatcher:EventDispatcher, type:String, listener:Function, caller:Object):void
		{
			dispatcher.removeEventListener(type, listener);
		}
		
		/**
		 * 注册侦听器
		 */
		private function reloadAddEventListener(dispatcher:Object, type:String, listener:Function, caller:Object):void
		{
			if(dispatcher is EventDispatcher)
			{
				dispatcher.addEventListener(type, listener);
			}
			else
			{
				dispatcher.addEventListener(type, listener, caller);
			}
			
		}
		
		/**
		 * 发送事件的接口
		 * @param message 这个参数既可以是字符串 也可以是事件类型
		 */
		private function reloadDispatchEvent(dispatcher:EventDispatcher, typeObject:Object, data:Object = null):void
		{
			if(typeObject is Event)
			{
				dispatcher.dispatchEvent(typeObject as Event);
			}
			else
			{
				dispatcher.dispatchEvent(new RetolderEvent(String(typeObject), data));
			}
		}
		
		/**
		 * 创建事件首发实例
		 */
		private function reloadGetEventDispatcher():EventDispatcher
		{
			return new EventDispatcher();
		}
		
		
		
		/**
		 * 返回一个新创建的Sprite实例
		 */
		private function reloadGetSprite():Sprite
		{
			return new Sprite();
		}
		
		/**
		 * 返回对象高度
		 */
		private function reloadGetHeight(object:Object):Number
		{
			return object.height;
		}
		
		/**
		 * 返回对象宽度
		 */
		private function reloadGetWidth(object:Object):Number
		{
			return object.width;
		}
		
		/**
		 * 针对单个被缓动的对象进行清理
		 */
		private function reloadRemoveTweenTo(object:Object):void
		{
			Tweener.removeTweens(object);
		}
		
		/**
		 * 对参数object里面的target对象进行缓动
		 * 针对批量数据
		 */
		private function reloadTweenTo(moveData:Object):void
		{
			Tweener.addTween(moveData.targetObject, {
				time:moveData.time ? moveData.time : 0.5,
				onStart:moveData.onStart,
				onUpdate:moveData.onUpdate,
				onComplete:moveData.onComplete,
//				transition: moveData.transition ? moveData.transition : "linear",
				transition: moveData.transition ? moveData.transition : "easeOutCirc",
				x: moveData.targetX,
				y: moveData.targetY
			});
			
		}
		
		/**
		 * 对参数object里面的target对象进行缓动
		 * <br/>
		 * 针对事件接口进行转化
		 */
		private function reloadTweenGeen(targetObject:Object, moveData:Object):void
		{
			var tweenObject:Object = moveData;
			
			tweenObject.time = moveData.time ? moveData.time : 0.5;
			tweenObject.transition =
				moveData.transition ? moveData.transition : "easeOutCirc";
			
			Tweener.addTween(targetObject, tweenObject);
			
		}
		
		/**
		 * 普通缓动
		 */
		private function reloadTween(targetObject:Object, tweenData:Object):void
		{
			Tweener.addTween(targetObject, tweenData);
		}
		
		/**
		 * 从父容器中移除显示对象
		 */
		private function reloadRemoveChildToParent(child:Object, parent:Object = null):void
		{
			if(hasParent(child))
			{
				child.parent.removeChild(child);
			}
		}
		
		/**
		 * 添加对象到容器内显示
		 */
		private function reloadAddChildToParent(child:Object, parent:Object):void
		{
			parent.addChild(child);
		}
		
		/**
		 * 判断对象是否有parent的属性
		 */
		private function reloldHasParent(object:Object):Boolean
		{
			return object.hasOwnProperty("parent") && object.parent;
		}		
		
		/**
		 * 调整某显示容器内 其子显示对象的层级
		 */
		private function reloadSetChildIndex(container:DisplayObjectContainer,
											child:DisplayObject, index:int):void
		{
			container.setChildIndex(child, index);
		}
		
		/**
		 * 获取全局坐标
		 */
		private function reloadGetGlobalPosition(object:DisplayObject, position:Object):Object
		{
			return object.localToGlobal(new Point(position.x, position.y));
		}
		
		/**
		 * 数组移除对象
		 */
		private function reloadRemoveFromArray(object:Object, array:Array):void
		{
			if(!array) return;
			
			var index:int = array.indexOf(object);
			
			if(index > -1)
			{
				array.splice(index, 1);
			}
		}
		
		/**
		 * 获取一个文本框
		 * <br/>
		 * 这必须是一个显示对象
		 * <br/>
		 * 而且字那么大 文本框就那么大
		 */
		private function reloadGetTextField(text:String = "", foramt:Object = null):Object
		{
			var textField:TextField = new TextField();
			
			textField.autoSize = TextFieldAutoSize.LEFT;
			
			textField.selectable = false;
			
			textField.mouseEnabled = false;
			
			textField.tabEnabled = false;
			
			if(foramt)
			{
				textField.defaultTextFormat = foramt as TextFormat;
				
			}
			
			textField.text = text;
			
			textField.width = textField.textWidth;
			
			textField.height = textField.textHeight;
			
			
			return textField;
		}
		
		/**
		 * 对一个文本框传递属性
		 */
		private function reloadSetTextField(textField:Object,  value:*, property:String):void
		{
			setProperty(textField, value, property);
		}
		
		/**
		 * 能快速的设置文本框的文字属性
		 */
		private function reloadSetTextInField(textField:Object,  text:String):void
		{
			setProperty(textField, text, "text");
		}
		
		
		/**
		 * 给Sprite设置交互作用域
		 * <br/>
		 * 在Flash里面不用实现
		 */
		public function reSetMouseRange(sprite:Object, w:Number, h:Number):void
		{
			
			
		}
		
		
	}
}

import flash.events.Event;

/**
 * 能传递数据的自定义事件
 */
class RetolderEvent extends Event
{
	/**
	 * 自定义数据
	 */
	public var data:Object;
	
	/**
	 * 能传递数据的自定义事件
	 */
	public function RetolderEvent(type:String, data:Object = null, 
								  bubbles:Boolean = false, cancelable:Boolean=false)
	{
		super(type, bubbles, cancelable);
		
		this.data = data;
	}
}
