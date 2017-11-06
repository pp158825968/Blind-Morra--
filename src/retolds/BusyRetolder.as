package retolds
{
	/**
	 * 接口翻译函数
	 * <br/>
	 * 为了能兼容Flash/LayaBox 对里面的特殊接口进行兼容
	 */
	public class BusyRetolder
	{
		/**
		 * 接口翻译函数
		 * <br/>
		 * 为了能兼容Flash/LayaBox 对里面的特殊接口进行兼容
		 */
		public function BusyRetolder()
		{
			// 提示要进行封装的方法
			// Busy?当然很忙很忙的
			// 因为这个实例无论在Laya还是在Flash中
			// 都只会创建一次
		}
		
		/**
		 * 版本字符
		 */
		public var versionName:String;
		
		/**
		 * 显示对象是否有父容器
		 */
		public var hasParent:Function;
		
		/**
		 * 将对象添加到父容器
		 * <br/>
		 * 第一个参数是显示对象 第二个必须是父容器
		 */
		public var addChildToParent:Function;
		
		/**
		 * 将对象添加到父容器
		 * <br/>
		 * 第一个参数是显示对象 第二个必须是父容器
		 */
		public var removeChildToParent:Function;
		
		/**
		 * 调整显示对象的层级
		 */
		public var setChildIndex:Function;
		
		/**
		 * 缓动函数
		 * <br/>
		 * 有一个参数传递缓动信息
		 */
		public var tweenTo:Function;
		
		/**
		 * 缓动函数
		 * <br/>
		 * 参数传递有不同 第一个是参数是进行缓动的对象 第二个是缓动
		 */
		public var tween:Function;
		
		/**
		 * 带有解析缓动时触发事件的函数
		 * <br/>
		 * Flash和Laya的缓动函数里面的参数有些不同
		 * <br/>
		 * 尤其是缓动事件的参数接口
		 */
		public var tweenGeen:Function;
		
		/**
		 * 置空缓动函数
		 */
		public var removeTweenTo:Function;
		
		/**
		 * 测量宽度
		 */
		public var getWidth:Function;
		
		/**
		 * 测量高度
		 */
		public var getHeight:Function;
		
		/**
		 * 创建显示容器对象
		 */
		public var getSprite:Function;
		
		/**
		 * 创建画图对象 - 非容器对象
		 */
		public var getShape:Function;
		
		/**
		 * 发送事件接口
		 */
		public var dispatchEvent:Function;
		
		/**
		 * 侦听事件接口
		 */
		public var addEventListener:Function;
		
		/**
		 * 移除侦听事件接口
		 */
		public var removeEventListener:Function;
		
		/**
		 * 创建事件收发对象
		 */
		public var getEventDispatcher:Function;
		
		/**
		 * 获取方块实例
		 * <br/>
		 * 这是一个图形
		 */
		public var getRect:Function;
		
		/**
		 * 获取几何意义上的方块
		 */
		public var getRectangle:Function;
		
		/**
		 * 给某个对象增加遮罩对象的方法
		 */
		public var addMask:Function;
		
		/**
		 * 获取鼠标对应的x坐标
		 */
		public var getMouseX:Function;
		
		/**
		 * 获取鼠标对应的y坐标
		 */
		public var getMouseY:Function;
		
		/**
		 * 设置拖拽
		 */
		public var startDrag:Function;
		
		/**
		 * 设置停止拖拽
		 */
		public var stopDrag:Function;
		
		/**
		 * π
		 */
		public var PI:Number;
		
		// 数学公式方法
		
		/**
		 * 开方
		 */
		public var sqrt:Function;
		
		/**
		 * sin
		 */
		public var sin:Function;
		
		/**
		 * cos
		 */
		public var cos:Function;
		
		/**
		 * tan
		 */
		public var tan:Function;
		
		/**
		 * 反正切
		 */
		public var atan2:Function;
		
		/**
		 * 反余弦
		 */
		public var acos:Function;
		
		/**
		 * 最小值
		 */
		public var min:Function;
		
		/**
		 * 最大值
		 */
		public var max:Function;
		
		/**
		 * 随机数计算
		 */
		public var random:Function;
		
		/**
		 * 向下取整
		 */
		public var round:Function;
		
		/**
		 * 四舍五入取整
		 */
		public var ceil:Function;
		
		/**
		 * 绝对值
		 */
		public var abs:Function;
		
		
		/**
		 * 获取舞台
		 */
		public var stage:Object;
		
		/**
		 * 设置对象对应的字段值
		 * <br/>
		 * 适用于setter接口
		 */
		public function setProperty(object:Object, value:*, property:String):void
		{
			object[property] = value;
		}
		
		/**
		 * 取出对象对应的字段值
		 * <br/>
		 * 适用于setter接口
		 */
		public function getProperty(object:Object, property:String):Object
		{
			return object[property];
		}
		
		// 各种事件
		
		/**
		 * 点击事件
		 */
		public var click:String;
		
		/**
		 * 鼠标按下事件
		 */
		public var mouse_down:String;
		
		/**
		 * 鼠标移动事件
		 */
		public var mouse_move:String;
		
		/**
		 * 鼠标抬起事件
		 */
		public var mouse_up:String;
		
		/**
		 * 按钮按下
		 */
		public var key_down:String;
		
		/**
		 * 添加到舞台
		 */
		public var added_to_stage:String;
		
		/**
		 * 从舞台中移除
		 */
		public var remove_from_stage:String;
		
		/**
		 * 按钮抬起
		 */
		public var key_up:String;
		
		/**
		 * 键盘方向键 - 上
		 */
		public var keycode_up:int;
		
		/**
		 * 键盘方向键 - 下
		 */
		public var keycode_down:int;
		
		/**
		 * 键盘方向键 - 左
		 */
		public var keycode_left:int;
		
		/**
		 * 键盘方向键 - 右
		 */
		public var keycode_right:int;
		
		
		/**
		 * 键盘方向键 - 上
		 */
		public var keycode_up_w:int;
		
		/**
		 * 键盘方向键 - 下
		 */
		public var keycode_down_s:int;
		
		/**
		 * 键盘方向键 - 左
		 */
		public var keycode_left_a:int;
		
		/**
		 * 键盘方向键 - 右
		 */
		public var keycode_right_d:int;
		
		/**
		 * 发送普通子弹
		 */
		public var keycode_fire:int;
		
		/**
		 * 发送技能
		 */
		public var keycode_skill:int;
		
		/**
		 * 碰撞检测函数
		 */
		public var hitTestFun:Function;
		
		/**
		 * 检测矩形碰撞
		 */
		public var hitInRect:Function;
		
		/**
		 * 获取两个矩形相交而形成的矩形
		 */
		public var getHitRect:Function;
		
		/**
		 * 以点作为基础 画出多边形
		 * <br/>
		 * 第一个是画笔对象  第二参数是点坐标数组 第三个是颜色 透明度组成的数据对象
		 */
		public var drawPolygonFun:Function;
		
		/**
		 * 获取键盘事件里面的键位码值
		 */
		public var getKeyCode:Function;
		
		/**
		 * 将纹理对象放入某个对象当中显示
		 */
		public var insertGrainFun:Function;
		
		/**
		 * 获取能进行纹理显示的对象
		 */
		public var getGrainViewerFun:Function;
		
		/**
		 * 根据路径 加载出图片类容
		 */
		public var loadImage:Function;
		
		/**
		 * 九三显示对象的全局坐标
		 */
		public var getGlobalPosition:Function;
		
		/**
		 * 数组移除对象
		 */
		public var removeFromArray:Function;
		
		/**
		 * 就算平面坐标点之间两点的距离
		 */
		public var distance:Function;
		
		/**
		 * 获取一个文本框
		 */
		public var getTextField:Function;
		
		/**
		 * 对一个文本框传递属性
		 */
		public var setTextField:Function;
		
		/**
		 * 能快速的设置文本框的文字属性
		 */
		public var setTextInField:Function;
		
		/**
		 * 播放音效的函数
		 */
		public var playSound:Function;
		
		/**
		 * 获取字典对象
		 */
		public var getDictionaryFun:Function;
		
		/**
		 * 自动将数值转成int值
		 */
		public var parseToInt:Function;
		
		/**
		 * 从数组里随机取出一个对象
		 */
		public var getRandomObjectInArray:Function;
		
		/**
		 * 设置鼠标交互的作用域
		 * <br/>
		 * 主要在laya里面使用
		 */
		public var setMouseRange:Function;
		
		
	}
}