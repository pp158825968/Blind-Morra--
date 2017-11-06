package retolds.subs
{
	
	import laya.display.Graphics;
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.events.Event;
	import laya.events.EventDispatcher;
	import laya.events.Keyboard;
	import laya.maths.MathUtil;
	import laya.maths.Point;
	import laya.maths.Rectangle;
	import laya.resource.Texture;
	import laya.utils.Dictionary;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import retolds.BusyRetolder;
	
	/**
	 * 针对Laya环境下的一般接口翻译
	 */
	public class LayaRetolder extends BusyRetolder
	{
		public function LayaRetolder()
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
			versionName = "Version BM-0.0.2-LayaBox";
			
			hasParent = reloldHasParent;
			
			addChildToParent = reAddChildToParent;
			
			removeChildToParent = reRemoveChildToParent;
			
			setChildIndex = reSetChildIndex;
			
//			tweenTo = reTween;
			
			tween = reTween;
			
			tweenGeen = reTweenGeen;
			
			removeTweenTo = reRemoveTweenTo;
			
			getWidth = reGetWidth;
			
			getHeight = reGetHeight;
			
			getSprite = reGetSprite;
			
			getShape = reGetShape;
			
			getEventDispatcher = reGetEventDispatcher;
			
			dispatchEvent = reDispatchEvent;
			
			addEventListener = reAddEventListener;
			
			removeEventListener = reRemoveEventListener;
			
			
			
			getRectangle = reGetRectangle;
			
			addMask = reAddMask;
			
			getMouseX = reGetMouseX;
			
			getMouseY = reGetMouseY;
			
			startDrag = reStartDrag;
			
			stopDrag = reStopDrag;
			
			hitTestFun = reHitTest;
			
			hitInRect = reHitInRect;
			
			getHitRect = reGetHitRect;
			
			//			hitTestFun = reHitInDistance;
			
			drawPolygonFun = reDrawPolygon;
			
			getKeyCode = reGetKeyCode;
			
			insertGrainFun = reInsertGrain;
			
			getGrainViewerFun = reGetGrainViewer;
			
			getGlobalPosition = reGetGlobalPosition;
			
			removeFromArray = reRemoveFromArray;
			
			distance = reDistance;
			
			getDictionaryFun = reGetDictionary;
			
			parseToInt = reParseInt;
			
			getRandomObjectInArray = reGetRandomObjectInArray;
			
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
			click = Event.CLICK;
			
			mouse_down = Event.MOUSE_DOWN;
			
			mouse_move = Event.MOUSE_MOVE;
			
			mouse_up = Event.MOUSE_UP;
			
			key_up = Event.KEY_UP;
			
			key_down = Event.KEY_DOWN;
			
			added_to_stage = Event.ADDED;
			
			remove_from_stage = Event.REMOVED;
			
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
			getTextField = reGetTextField;
			
			setTextField = reSetTextField;
			
			setTextInField = reSetTextInField;
		}
		
		private function reGetHeight(object:Object):Number
		{
			return object.height;
		}
		
		private function reGetWidth(object:Object):Number
		{
			return object.width;
		}
		
		/**
		 * 从数组里随机取出一个对象
		 */
		private function reGetRandomObjectInArray(arr:Array):Object
		{
			var index:int = arr.length * random();
			
			return arr[index];
		}
		
		/**
		 * 将参数的值转成int值
		 * <br/>
		 * 因为int()方法在Laya里面无效
		 */
		private function reParseInt(value:Object):int
		{
			return parseInt(String(value));
		}
		
		/**
		 * 获取字典对象
		 */
		private function reGetDictionary():Object
		{
			return new Dictionary();
		}
		
		/**
		 * 计算距离
		 */
		private function reDistance(p1:Object, p2:Object):Number
		{
			var newP1:Point = new Point(p1.x, p1.y);
			var newP2:Point = new Point(p2.x, p2.y);
			
			return newP1.distance(newP2.x, newP2.y);
		}		
		
		
		/**
		 * 获取一个能显示纹理的对象
		 * <br/>
		 * 在flash里面就是bitmap了
		 */
		private function reGetGrainViewer():Object
		{
			return new Sprite();
		}
		
		/**
		 * 将纹理放入到位图显示
		 */
		private function reInsertGrain(sprite:Sprite, texture:Texture):void
		{
			// layaBox中 优先用Sprite显示纹理
			sprite.graphics.drawTexture(texture);
		}		
		
		
		/**
		 * 获取键盘事件里面的键位码
		 */
		private function reGetKeyCode(event:Event):Object
		{
			return event.keyCode;
		}
		
		/**
		 * 创建一个新的Shape对象
		 */
		private function reGetShape():Sprite
		{
			return new Sprite();
		}
		
		/**
		 * 画出多边形
		 */
		private function reDrawPolygon(graphicsObject:Object, points:Array, styleObject:Object = null):void
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
			
			g.drawPoly(0, 0, points, fillColor, lineColor, thickness);
			
			
		}
		
		/**
		 * 通过距离来进行碰撞检测
		 */
		private function reHitInDistance(currentObject:Object, hitObject:Object):void
		{
			
		}
		
		/**
		 * 碰撞检测函数
		 */
		private function reHitTest(currentObject:Object, hitObject:Object):Boolean
		{
			// return Sprite(currentObject).hi(hitObject as DisplayObject);
			// 优先使用矩阵检测
			return false;
		}
		
		/**
		 * 碰撞检测函数 - 以矩形作为检测对象
		 */
		private function reHitInRect(rectA:Rectangle, rectB:Rectangle):Boolean
		{
			return rectA.intersects(rectB);
		}
		
		/**
		 * 获取香蕉矩形
		 */
		private function reGetHitRect(rectA:Rectangle, rectB:Rectangle):Rectangle
		{
			return rectA.intersection(rectB);
		}
		
		
		/**
		 * 停止对显示对象的拖拽
		 */
		private function reStopDrag(object:Sprite):void
		{
			object.stopDrag();
		}
		
		/**
		 * 显示对象的拖拽功能
		 */
		private function reStartDrag(object:Sprite, lockCenter:Boolean = false, bounds:Rectangle = null):void
		{
			object.startDrag(bounds, lockCenter);
		}
		
		/**
		 * 获取对象的鼠标y
		 */
		private function reGetMouseY(object:Object):Number
		{
			return object["mouseY"];
		}
		
		/**
		 * 获取对象的鼠标x
		 */
		private function reGetMouseX(object:Object):Number
		{
			return object["mouseX"];
		}
		
		/**
		 * 给显示对象加上遮罩
		 */
		private function reAddMask(displayObject:Sprite, 
									   maskObject:Sprite, showContainer:Sprite):void
		{
			displayObject.mask = maskObject;
			
		}
		
		
		
		/**
		 * 获取几何意义上的方块
		 */
		private function reGetRectangle(x:Number, y:Number, w:Number, h:Number):Rectangle
		{
			return new Rectangle(x, y, w, h);
			
		}
		
		/**
		 * 移除侦听器
		 */
		private function reRemoveEventListener(dispatcher:EventDispatcher, type:String, listener:Function, caller:Object):void
		{
//			dispatcher.removeEventListener(type, listener);
			dispatcher.off(type, caller, listener);
		}
		
		/**
		 * 注册侦听器
		 */
		private function reAddEventListener(dispatcher:Object, type:String, 
											listener:Function, caller:Object):void
		{
			if(dispatcher is EventDispatcher)
			{
				dispatcher.on(type, caller, listener);
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
		private function reDispatchEvent(dispatcher:EventDispatcher, typeObject:Object, data:Object = null):void
		{
//			trace("reDispatchEvent typeObject " + typeObject);
//			trace("reDispatchEvent data " + data);
			
			// 为了与Flash的事件逻辑一致
			// 这里需要创建一个Event实例
			
			var event:RetolderEvent = new RetolderEvent(String(typeObject), data);
			
			dispatcher.event(String(typeObject), event);
		}
		
		/**
		 * 创建事件首发实例
		 */
		private function reGetEventDispatcher():EventDispatcher
		{
			return new EventDispatcher();
		}
		
		
		
		/**
		 * 返回一个新创建的Sprite实例
		 */
		private function reGetSprite():Sprite
		{
			return new Sprite();
		}
		
		
		/**
		 * 针对单个被缓动的对象进行清理
		 */
		private function reRemoveTweenTo(object:Object):void
		{
			Tween.clearTween(object);
		}
		
		/**
		 * 对参数object里面的target对象进行缓动
		 * 针对批量数据
		 */
		private function reTween(moveData:Object):void
		{
			Tween.to(moveData.targetObject, {
				update:moveData.onUpdate,
				complete:moveData.onComplete,
				// transition: moveData.transition ? moveData.transition : "linear",
				// ease: moveData.transition ? moveData.transition : Ease.backOut(10, 20, 30, 40),
				x: moveData.targetX,
				y: moveData.targetY
			}, 
			moveData.time ? moveData.time * 1000 : 500);
		}
		
		/**
		 * 对参数object里面的target对象进行缓动
		 * <br/>
		 * 针对事件接口进行转化
		 */
		private function reTweenGeen(targetObject:Object, moveData:Object):void
		{
			var tweenObject:Object = moveData;
			
			tweenObject.time = moveData.time ? moveData.time : 0.5;
			tweenObject.transition =
				moveData.transition ? moveData.transition : "easeOutCirc";
			
			// 更新Handler
			var updateHandler:Handler = new Handler(tweenObject, moveData.onUpdate, null);
			
			tweenObject.update = updateHandler;
			
			// 完成Handler
			var completeHandler:Handler = new Handler(tweenObject, moveData.onComplete, null, true);
			
			tweenObject.complete = completeHandler;
			
			Tween.to(targetObject, tweenObject, moveData.time ? moveData.time * 1000 : 500);
			
		}
		
		/**
		 * 从父容器中移除显示对象
		 */
		private function reRemoveChildToParent(child:Object, parent:Object = null):void
		{
			if(hasParent(child))
			{
				child.parent.removeChild(child);
			}
		}
		
		/**
		 * 添加对象到容器内显示
		 */
		private function reAddChildToParent(child:Object, parent:Object):void
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
		private function reSetChildIndex(container:Sprite,
											 child:Sprite, index:int):void
		{
			container.setChildIndex(child, index);
		}
		
		/**
		 * 获取全局坐标
		 */
		private function reGetGlobalPosition(object:Sprite, position:Object):Object
		{
			return object.localToGlobal(new Point(position.x, position.y));
		}
		
		/**
		 * 数组移除对象
		 */
		private function reRemoveFromArray(object:Object, array:Array):void
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
		private function reGetTextField(text:String = "", foramt:Object = null):Object
		{
			var textField:Text = new Text();
			
			textField.autoSize = true;
			
			// textField.align = "center";
			
			textField.mouseEnabled = false;
			
			textField.text = text;
			
//			textField.width = textField.textWidth;
//			
//			textField.height = textField.textHeight;
			
			return textField;
		}
		
		/**
		 * 对一个文本框传递属性
		 */
		private function reSetTextField(textField:Object,  value:*, property:String):void
		{
			setProperty(textField, value, property);
		}
		
		/**
		 * 能快速的设置文本框的文字属性
		 */
		private function reSetTextInField(textField:Object,  text:String):void
		{
			setProperty(textField, text, "text");
		}
		
		/**
		 * 给Sprite设置交互作用域
		 * <br/>
		 * 在LayaBox做鼠标交互的时候 必须要注意的问题
		 */
		public function reSetMouseRange(sprite:Sprite, w:Number, h:Number):void
		{
			sprite.width = w;
			sprite.height = h;
			
			sprite.hitArea = new Rectangle(0, 0, w, h);
		}
		
		
	}
}

import laya.events.Event;


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
	public function RetolderEvent(eventType:String, dataObject:Object = null)
	{
		super();
		
		type = eventType;
		
		data = dataObject;
		
//		trace("RetolderEvent data" + data);
	}
}