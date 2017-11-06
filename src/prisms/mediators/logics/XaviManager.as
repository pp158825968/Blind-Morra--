package prisms.mediators.logics
{
	import prisms.mediators.Arrester;
	import prisms.views.tenteis.uis.TitleTent;
	

	/**
	 * 游戏操作部分的逻辑管理类
	 * <br/>
	 * 中场大师当之无愧
	 */
	public class XaviManager
	{
		
		/**
		 * 游戏操作部分的逻辑管理类
		 * <br/>
		 * 中场大师当之无愧
		 */
		public function XaviManager()
		{
			
		}
		
		/**
		 * 中场大师
		 */
		public var xavi:XaviManager;
		
		/**
		 * 中场大师登场
		 */
		public function listenToXAVI():void
		{
//			initMapListener();
			// 要听从哈维的调度
			
//			initAndGotoLevel1();
			
			makeButtons();
			
			showTitleTent();
		}
		
		/**
		 * 创建ui中使用的所有按钮
		 * <br/>
		 * 并且给按钮注册好事件
		 */
		private function makeButtons():void
		{
			Arrester.buttonManager.standardToButtons();
			
			Arrester.uiLogic.listenToUILogic();
		}
		
		/**
		 * 主标题场景
		 */
		private var titleTent:TitleTent;
		
		/**
		 * 显示 主标题场景
		 */
		private function showTitleTent():void
		{
			titleTent = Arrester.uiTentManager.standardToTitleTent();
			
			Arrester.retolder.addChildToParent(titleTent.mainContainer, Arrester.stage);
			
		}		
		
		private function initAndGotoLevel1():void
		{
			// 过关的判断 也在这里进行
			Arrester.levelManager.standardToLevelTend();
			
			Arrester.levelManager.gotoTheLevel(1);
			
			Arrester.retolder.addChildToParent(Arrester.levelManager.levelTend.mainContainer,
				Arrester.stage);
		}
		
		
		
		
	}
}

class BackUp
{
	public function BackUp()
	{
		
	}
	
	
//	/**
//	 * 注册地图方面相关的侦听器
//	 */
//	private function initMapListener():void
//	{
//		//			Arrester.mapManager.map.addEventListener(BaseMap.MAP_DOWN, onMapDown);
//		
//		Arrester.retolder.addEventListener(Arrester.stage, Arrester.retolder.key_down, onKeyDown);
//		
//		Arrester.mapManager.map.addEventListener(BaseMap.MAP_DOWN, onMapZSort);
//		
//		onMapZSort(null);
//		
//		var event:Object = new Object();
//		
//		event.data = {x: 80, y: 0}
//		
//		onMapZSort(event);
//	}
//	
//	/**
//	 * 进行z排序
//	 */
//	private function onMapZSort(event:Object):void
//	{
//		var downPosX:Number = event ? event.data.x : 80;
//		var downPosY:Number = event ? event.data.y : 40;
//		
//		var downPosition:Point3D = IsoTransTool.screenToIso({x:downPosX, y:downPosY});
//		
//		var indexObject:Object = Arrester.mapDataManager.mapData.guessIndex(downPosition);
//		
//		var tileSize:Number = Arrester.mapDataManager.mapData.gridSize;
//		
//		var rowIndex:int = indexObject.rowIndex;
//		var columnIndex:int = indexObject.columnIndex;
//		
//		var posX:Number = columnIndex * tileSize;
//		var posZ:Number = rowIndex * tileSize;
//		
//		var cube:BaseCube = new BaseCube(tileSize, tileSize, 0x778855);
//		
//		cube.position = new Point3D(posX, 0, posZ);
//		
//		Arrester.retolder.addChildToParent(cube.mainContainer, Arrester.mapManager.map.frostContainer.mainContainer);
//		
//		Arrester.mapManager.map.addIsosToFrost(cube);
//	}
//	
//	/**
//	 * 键盘按下
//	 */
//	public function onKeyDown(event:Object):void
//	{
//		var player:PlayerData = Arrester.playerManager.player;
//		
//		switch(Arrester.retolder.getKeyCode(event))
//		{
//			case Arrester.retolder.keycode_up_w:
//				
//				player.velocity = new Point3D(0, 0, -10);
//				
//				break;
//			
//			case Arrester.retolder.keycode_down_s:
//				
//				player.velocity = new Point3D(0, 0, 10);
//				
//				break;
//			
//			case Arrester.retolder.keycode_left_a:
//				
//				player.velocity = new Point3D(-10, 0, 0);
//				
//				break;
//			
//			case Arrester.retolder.keycode_right_d:
//				
//				player.velocity = new Point3D(10, 0, 0);
//				
//				break;
//			
//			case Arrester.retolder.keycode_fire:
//				
//				player.velocity = new Point3D();
//				
//				playerFire();
//				
//				break;
//			
//			default:
//				
//				// player.steer = new Point3D();
//				player.velocity = new Point3D();
//				
//				break;
//			
//		}
//		
//		// 运动时判断碰撞检测
//		player.update();
//		Arrester.mapManager.map.sortForDepth();
//	}
//	
//	/**
//	 * 玩家发射子弹
//	 */
//	private function playerFire():void
//	{
//		var player:PlayerData = Arrester.playerManager.player;
//		
//		var indexObject:Object = Arrester.mapDataManager.mapData.guessIndex(player.view.position);
//		
//		var tileSize:Number = Arrester.mapDataManager.mapData.gridSize;
//		
//		var rowIndex:int = indexObject.rowIndex;
//		var columnIndex:int = indexObject.columnIndex;
//		
//		var posX:Number = columnIndex * tileSize;
//		var posY:Number = - tileSize * 0.5;
//		var posZ:Number = rowIndex * tileSize;
//		
//		var cube:BaseCube = new BaseCube(10, 10, 0x778855);
//		
//		cube.position = new Point3D(posX, posY, posZ);
//		
//		Arrester.mapManager.map.addIsosToFrost(cube);
//		
//		var gridData:GridData = Arrester.mapDataManager.mapData.findTile(0, 4);
//		
//		trace(gridData.view.position);
//		
//		var targetPosition:Point3D = gridData.view.position;
//		
//		Arrester.retolder.tween(cube, 
//			{time:5, x: targetPosition.x, y: posY, z:targetPosition.z, 
//				onUpdate: function():void
//				{
//					// 怎样做碰撞检测
//					var indexObject:Object = Arrester.mapDataManager.mapData.guessIndex(cube.position);
//					
//					// trace("indexObject " + indexObject.rowIndex, indexObject.columnIndex);
//				}
//			});
//		
//		
//	}
//	
//	/**
//	 * 地图被点击时 标记下砖块的颜色
//	 */
//	private function onMapDown(event:Object):void
//	{
//		return;
//		var downPosX:Number = event.data.x;
//		var downPosY:Number = event.data.y;
//		
//		var downPosition:Point3D = IsoTransTool.screenToIso({x:downPosX, y:downPosY});
//		
//		var tileSize:Number = Arrester.mapDataManager.mapData.gridSize;
//		
//		var startX:Number = -tileSize * 0.5;
//		var startZ:Number = -tileSize * 0.5;
//		
//		// 根据按下的位置 判断哪个格子被点中了
//		var downRowIndex:int = ((downPosition.z - startZ) / tileSize);
//		
//		var downColumnIndex:int = ((downPosition.x - startX) / tileSize);
//		
//		//			trace("downPosition " + downPosition, "  downRowIndex " + downRowIndex, "downColumnIndex " + downColumnIndex);
//		//			trace("downPosition " + downPosition);
//		trace("downRowIndex " + downRowIndex, "downColumnIndex " + downColumnIndex);
//		
//		var gridData:GridData = 
//			Arrester.mapDataManager.mapData.findTile(downRowIndex, downColumnIndex);
//		
//		gridData.view.tileColor = Arrester.retolder.random() * 0x0088F0;
//		
//	}
	
	
	
}