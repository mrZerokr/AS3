/*
class: NativeWindowHelper
package: mrzerokr.air
version: 0.1
www.mrZero.kr - mrzerokr@gmail.com
# 2016.06.05
- remodeling version
*/
package mrzerokr.air
{
	import flash.display.NativeMenu;
	import flash.display.NativeWindow;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.NativeWindowBoundsEvent;
	import flash.events.NativeWindowDisplayStateEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class NativeWindowHelper extends Sprite
	{
		//////////////////////////////////////////////////
		// Private Variables
		
		protected var _context:NativeWindowContext;
		private var _c:NativeWindowContext;
		
		
		//////////////////////////////////////////////////
		// Public Variables
		/**
		 * 윈도우 컨택스트 객체의 참조입니다. 
		 */		
		public function get context():NativeWindowContext{ return this._context; }
		
		/**
		 * Flash Player 또는 브라우저에서 스테이지 정렬을 지정하는 StageAlign 클래스 값입니다. 
		 */		
		public function get stageAlign():String{ return this._c.stageAlign }
		public function set stageAlign(v:String):void{ this._c.stageAlign = v }
		/**
		 * 사용할 크기 조절 모드를 지정하는 StageScaleMode 클래스 값입니다. 
		 */		
		public function get stageScaleMode():String{ return this._c.stageScaleMode }
		public function set stageScaleMode(v:String):void{ this._c.stageScaleMode = v }
		/**
		 * 
		 */
		public function get stageColor():uint{ return this._c.stageColor }
		public function set stageColor(v:uint):void{ this._c.stageColor = v }
		/**
		 * 참조 윈도우가 활성 응용 프로그램 윈도우인지 여부를 나타냅니다. 
		 */		
		public function get active():Boolean{ return this._c.active }
		/**
		 * 참조 윈도우가 항상 다른 윈도우(다른 응용 프로그램의 윈도우 포함)의 앞에 오도록 할지 여부를 지정합니다. 
		 */		
		public function get alwaysInFront():Boolean{ return this._c.alwaysInFront }
		public function set alwaysInFront(v:Boolean):void{ this._c.alwaysInFront = v }
		/**
		 * 참조 윈도우의 크기 및 위치입니다. 
		 */		
		public function get bounds():Rectangle{ return this._c.bounds }
		public function set bounds(v:Rectangle):void{ this._c.bounds = v }
		/**
		 * 참조 윈도우가 닫혔는지 여부를 나타냅니다. 
		 */		
		public function get closed():Boolean{ return this._c.closed }
		/**
		 * 참조 윈도우의 표시 상태입니다. 
		 */		
		public function get displayState():String{ return this._c.displayState }
		/**
		 * 참조 윈도우를 만드는 데 사용된 최대화 가능 설정을 보고합니다.
		 */		
		public function get maximizable():Boolean{ return this._c.maximizable }
		public function set maximizable(v:Boolean):void{
			this._c.maximizable = v;
			this.reload();
		}
		/**
		 * 참조 윈도우의 최대 크기입니다. 
		 */		
		public function get maxSize():Point{ return this._c.maxSize }
		public function set maxSize(v:Point):void{ this._c.maxSize = v }
		/**
		 * 참조 윈도우의 기본 메뉴입니다. 
		 */		
		public function get menu():NativeMenu{ return this._c.menu }
		public function set menu(v:NativeMenu):void{ this._c.menu = v }
		/**
		 * 참조 윈도우를 만드는 데 사용된 최소화 가능 설정을 보고합니다. 
		 */		
		public function get minimizable():Boolean{ return this._c.minimizable }
		public function set minimizable(v:Boolean):void{
			this._c.minimizable = v;
			this.reload();
		}
		/**
		 * 참조 윈도우의 최소 크기입니다. 
		 */		
		public function get minSize():Point{ return this._c.minSize }
		public function set minSize(v:Point):void{ this._c.minSize = v }
		/**
		 * 참조 윈도우를 소유하는 NativeWindow 객체입니다. 
		 */		
		public function get owner():NativeWindow{ return this._c.owner }
		public function set owner(v:NativeWindow):void{
			this._c.owner = v;
			this.reload();
		}
		/**
		 * 참조 윈도우를 만드는 데 사용된 윈도우 renderMode 설정을 보고합니다. 
		 */		
		public function get renderMode():String{ return this._c.renderMode }
		public function set renderMode(v:String):void{
			this._c.renderMode = v;
			this.reload();
		}
		/**
		 * 참조 윈도우를 만드는 데 사용된 크기 조절 가능 설정을 보고합니다. 
		 */		
		public function get resizable():Boolean{ return this._c.resizable }
		public function set resizable(v:Boolean):void{
			this._c.resizable = v;
			this.reload();
		}
		/**
		 * 참조 윈도우를 만드는 데 사용된 시스템 크롬 설정을 보고합니다. 
		 */		
		public function get systemChrome():String{ return this._c.systemChrome }
		public function set systemChrome(v:String):void{
			this._c.systemChrome = v;
			this.reload();
		}
		/**
		 * 참조 윈도우 제목입니다. 
		 */		
		public function get title():String{ return this._c.title }
		public function set title(v:String):void{ this._c.title = v }
		/**
		 * 참조 윈도우를 만드는 데 사용된 투명도 설정을 보고합니다. 
		 */		
		public function get transparent():Boolean{ return this._c.transparent }
		public function set transparent(v:Boolean):void{
			this._c.transparent = v;
			this.reload();
		}
		/**
		 * 참조 윈도우를 만드는 데 사용된 윈도우 유형 설정을 보고합니다. 
		 */		
		public function get type():String{ return this._c.type }
		public function set type(v:String):void{
			this._c.type = v;
			this.reload();
		}
		/**
		 * 참조 윈도우의 표시 여부를 지정합니다. 
		 */		
		public function get windowVisible():Boolean{ return this._c.visible }
		public function set windowVisible(v:Boolean):void{ this._c.visible = v }
		/**
		 * 참조 윈도우의 폭(픽셀)입니다. 
		 */		
		public function get windowWidth():Number{ return this._c.width }
		public function set windowWidth(v:Number):void{ this._c.width = v }
		/**
		 * 참조 윈도우의 높이(픽셀)입니다. 
		 */		
		public function get windowHeight():Number{ return this._c.height }
		public function set windowHeight(v:Number):void{ this._c.height = v }
		/**
		 * 운영 체제 데스크톱의 원점을 기준으로 하는 참조 윈도우의 왼쪽 위 모서리에 대한 가로 축 좌표입니다. 
		 */		
		public function get windowX():Number{ return this._c.x }
		public function set windowX(v:Number):void{ this._c.x = v }
		/**
		 * 운영 체제 데스크톱의 왼쪽 위 모서리를 기준으로 하는 참조 윈도우의 왼쪽 위 모서리에 대한 세로 축 좌표입니다. 
		 */		
		public function get windowY():Number{ return this._c.y }
		public function set windowY(v:Number):void{ this._c.y = v }
		/**
		 * 참조 네이티브윈도우 객체입니다. (생성되어있지 않으면 자동생성 됩니다.) 
		 */		
		public function get window():NativeWindow{ return this._c.getNativeWindow() }
		public function set window(v:NativeWindow):void{ this._c.setNativeWindow(v) }
		
		
		
		
		
		//////////////////////////////////////////////////
		// Constructor
		/**
		 * 새 NativeWindoHelper 인스턴스 및 해당 운영 체제 윈도우를 만듭니다. 
		 * @param context
		 */		
		public function NativeWindowHelper( context:NativeWindowContext = null )
		{
			this._c = this._context = ( context ) ? context : new NativeWindowContext;
			this._c.setWindowHelper( this );
			this._c.root = this;
		}
		
		
		
		//////////////////////////////////////////////////
		// Public Methods
		
		/**
		 * 이 윈도우를 재설정합니다. 
		 */		
		public function reload():void{ this._c.reload() }
		public function reloadLock():void{ this._c.reloadLock() }
		public function reloadUnlock():void{ this._c.reloadUnlock() }
		
		/**
		 * 이 윈도우의 사이즈를 설정합니다. 
		 * @param width
		 * @param height
		 */		
		public function setSize( width:uint, height:uint ):void{
			this._c.setSize( width, height );
		}
		/**
		 * 이 윈도우의 위치를 설정합니다. 
		 * @param x
		 * @param y
		 */		
		public function setPosition( x:int, y:int ):void
		{
			this._c.setPosition( x, y );
		}
		
		// NativeWindow Methods
		/**
		 * 이 윈도우를 활성화합니다. 
		 */		
		public function activate():void
		{
			this.window.activate();
		}
		/**
		 * 이 윈도우를 닫습니다. 
		 */		
		public function close():void
		{
			this.window.close();
		}
		/**
		 * 윈도우 스테이지의 원점을 기준으로 하는 픽셀 좌표의 포인트(표시 목록에 대한 전역 포인트)를 가상 데스크톱의 포인트로 변환합니다. 
		 * @param globalPoint
		 * @return 
		 */		
		public function globalToScreen( globalPoint:Point ):Point
		{
			return this.window.globalToScreen( globalPoint );
		}
		/**
		 * 이 윈도우가 소유하고 있는 NativeWindow 객체의 목록을 반환합니다. 
		 * @return 
		 */		
		public function listOwnedWindows():Vector.<NativeWindow>
		{
			return this.window.listOwnedWindows();
		}
		/**
		 * 이 윈도우를 최대화합니다. 
		 */		
		public function maximize():void{
			this.window.maximize();
		}
		/**
		 * 이 윈도우를 최소화합니다. 
		 */		
		public function minimize():void
		{
			this.window.minimize();
		}
		/**
		 * 관련 이벤트가 발생한 운영 체제를 통해 시각적 큐를 트리거합니다. 
		 * @param type
		 */		
		public function notifyUser( type:String ):void
		{
			this.window.notifyUser( type );
		}
		/**
		 * 이 윈도우를 지정된 윈도우의 바로 뒤로 보냅니다. 
		 * @param window
		 * @return 
		 */		
		public function orderInBackOf( window:NativeWindow ):Boolean
		{
			return this.window.orderInBackOf( window );
		}
		/**
		 * 이 윈도우를 지정된 윈도우의 바로 앞으로 가져옵니다. 
		 * @param window
		 * @return 
		 */		
		public function orderInFrontOf( window:NativeWindow ):Boolean
		{
			return this.window.orderInFrontOf( window );
		}
		/**
		 * 이 윈도우를 표시된 다른 윈도우의 뒤로 보냅니다. 
		 * @return 
		 */		
		public function orderToBack():Boolean{
			return this.window.orderToBack();
		}
		/**
		 * 이 윈도우를 표시된 다른 윈도우의 앞으로 가져옵니다. 
		 * @return 
		 */		
		public function orderToFront():Boolean{
			return this.window.orderToFront();
		}
		/**
		 * 최소화 또는 최대화된 상태에서 이 윈도우를 복원합니다. 
		 */		
		public function restore():void{
			this.window.restore();
		}
		/**
		 * 이 윈도우의 시스템 제어 이동을 시작합니다. 
		 */		
		public function startMove():void{
			this.window.startMove();
		}
		/**
		 * 이 윈도우의 시스템 제어 크기 조절 작업을 시작합니다. 
		 * @param edgeOrCorner
		 * @return 
		 */		
		public function startResize( edgeOrCorner:String = "BR" ):Boolean{
			return this.window.startResize( edgeOrCorner );
		}
		
		
		
		//////////////////////////////////////////////////
		// Private Methods (Protected)
		
		protected function onWindowActivate( event:Event ):void{}
		protected function onWindowDeactivate( event:Event ):void{}
		protected function onWindowClose( event:Event ):void{}
		protected function onWindowClosing( event:Event ):void{}
		protected function onWindowDisplayStateChange( event:NativeWindowDisplayStateEvent ):void{}
		protected function onWindowDisplayStateChanging( event:NativeWindowDisplayStateEvent ):void{}
		protected function onWindowMove( event:NativeWindowBoundsEvent ):void{}
		protected function onWindowMoving( event:NativeWindowBoundsEvent ):void{}
		protected function onWindowResize( event:NativeWindowBoundsEvent ):void{}
		protected function onWindowResizing( event:NativeWindowBoundsEvent ):void{}
		
		
		
		//////////////////////////////////////////////////
		// Internal Methods
		
		internal function windowEventDelegate( event:Event ):void{
			switch( event.type )
			{
				case Event.ACTIVATE: this.onWindowActivate( event ); break;
				case Event.DEACTIVATE: this.onWindowDeactivate( event ); break;
				case Event.CLOSE: this.onWindowClose( event ); break;
				case Event.CLOSING: this.onWindowClosing( event ); break;
				case NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE:
					this.onWindowDisplayStateChange( event as NativeWindowDisplayStateEvent ); break;
				case NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING:
					this.onWindowDisplayStateChanging( event as NativeWindowDisplayStateEvent ); break;
				case NativeWindowBoundsEvent.MOVE:
					this.onWindowMove( event as NativeWindowBoundsEvent ); break;
				case NativeWindowBoundsEvent.MOVING:
					this.onWindowMoving( event as NativeWindowBoundsEvent ); break;
				case NativeWindowBoundsEvent.RESIZE:
					this.onWindowResize( event as NativeWindowBoundsEvent ); break;
				case NativeWindowBoundsEvent.RESIZING:
					this.onWindowResizing( event as NativeWindowBoundsEvent ); break;
			}
		}
	}
}








/*
History
# 2016.06.05
- remodeling version
*/