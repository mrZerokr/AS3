/*
class: NativeWindowContext
package: mrzerokr.air
version: 0.1
www.mrZero.kr - mrzerokr@gmail.com
*/
package mrzerokr.air
{
	import flash.display.DisplayObject;
	import flash.display.NativeMenu;
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.NativeWindowBoundsEvent;
	import flash.events.NativeWindowDisplayStateEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class NativeWindowContext
	{
		//////////////////////////////////////////////////
		// Static
		static public var defatultContext:NativeWindowContext;
		
		
		//////////////////////////////////////////////////
		// Private Variables
		private var _nativeWindow:NativeWindow;
		private var _alwaysInFront:Boolean;
		private var _bounds:Rectangle;
		private var _menu:NativeMenu;
		private var _maxSize:Point;
		private var _minSize:Point;
		private var _title:String;
		private var _visible:Boolean;
		private var _stageColor:uint;
		
		
		//////////////////////////////////////////////////
		// Public Variables
		
		// Stage
		public var stageAlign:String = StageAlign.TOP_LEFT;
		
		public var stageScaleMode:String = StageScaleMode.NO_SCALE;
		
		public var root:DisplayObject;
		
		
		// NativeWindowInitOptions
		/**
		 * 참조 윈도우를 만드는 데 사용된 최대화 가능 설정을 보고합니다.
		 */		
		public var maximizable:Boolean;
		/**
		 * 참조 윈도우를 만드는 데 사용된 최소화 가능 설정을 보고합니다. 
		 */		
		public var minimizable:Boolean;
		/**
		 * 참조 윈도우를 소유하는 NativeWindow 객체입니다. 
		 */		
		public var owner:NativeWindow;
		/**
		 * 참조 윈도우를 만드는 데 사용된 윈도우 renderMode 설정을 보고합니다. 
		 */		
		public var renderMode:String;
		/**
		 * 참조 윈도우를 만드는 데 사용된 크기 조절 가능 설정을 보고합니다. 
		 */		
		public var resizable:Boolean;
		/**
		 * 참조 윈도우를 만드는 데 사용된 시스템 크롬 설정을 보고합니다. 
		 */		
		public var systemChrome:String;
		/**
		 * 참조 윈도우를 만드는 데 사용된 투명도 설정을 보고합니다. 
		 */		
		public var transparent:Boolean;
		/**
		 * 참조 윈도우를 만드는 데 사용된 윈도우 유형 설정을 보고합니다. 
		 */		
		public var type:String;
		
		
		
		// NativeWindow
		
		public function get running():Boolean{ return ( this._nativeWindow ) ? true:false }
		
		public function get nativeWindow():NativeWindow{ return this._nativeWindow }
		
		public function get stageColor():uint{
			if( this._nativeWindow ) this._stageColor = this._nativeWindow.stage.color;
			return this._stageColor;
		}
		public function set stageColor( v:uint ):void{
			this._stageColor = v;
			if( this._nativeWindow ) this._nativeWindow.stage.color = this._stageColor;
		}
		
		/**
		 * 참조 윈도우가 활성 응용 프로그램 윈도우인지 여부를 나타냅니다. 
		 */		
		public function get active():Boolean{
			return ( this._nativeWindow ) ? this._nativeWindow.active : false;
		}
		
		/**
		 * 참조 윈도우의 Stage 객체입니다. 
		 */		
		public function get stage():Stage{
			return ( this._nativeWindow ) ? this._nativeWindow.stage:null;
		}
		
		/**
		 * 참조 윈도우가 항상 다른 윈도우(다른 응용 프로그램의 윈도우 포함)의 앞에 오도록 할지 여부를 지정합니다. 
		 */		
		public function get alwaysInFront():Boolean{
			if( this._nativeWindow ) this._alwaysInFront = this._nativeWindow.alwaysInFront;
			return this._alwaysInFront;
		}
		public function set alwaysInFront( state:Boolean ):void{
			this._alwaysInFront = state;
			if( this._nativeWindow ) this._nativeWindow.alwaysInFront = state;
		}
		
		/**
		 * 참조 윈도우의 크기 및 위치입니다. 
		 */		
		public function get bounds():Rectangle{
			if( this._nativeWindow ) this._bounds = this._nativeWindow.bounds;
			return this._bounds;
		}
		public function set bounds( v:Rectangle ):void{
			this._bounds.copyFrom( v );
			if( this._nativeWindow ) this._nativeWindow.bounds = this._bounds;
		}
		
		/**
		 * 참조 윈도우가 닫혔는지 여부를 나타냅니다. 
		 */		
		public function get closed():Boolean{ return ( this._nativeWindow ) ? this._nativeWindow.closed:true; }
		
		/**
		 * 참조 윈도우의 표시 상태입니다. 
		 */		
		public function get displayState():String{
			if( this._nativeWindow ) return this._nativeWindow.displayState;
			else return undefined;
		}
		
		/**
		 * 운영 체제 데스크톱의 원점을 기준으로 하는 참조 윈도우의 왼쪽 위 모서리에 대한 가로 축 좌표입니다. 
		 */		
		public function get x():Number{
			if( this._nativeWindow ) this._bounds.x = this._nativeWindow.x;
			return this._bounds.x;
		}
		public function set x( v:Number ):void{
			if( !this._nativeWindow ) this._bounds.x = v;
			else this._bounds.x = this._nativeWindow.x = v;
		}
		
		/**
		 * 운영 체제 데스크톱의 왼쪽 위 모서리를 기준으로 하는 참조 윈도우의 왼쪽 위 모서리에 대한 세로 축 좌표입니다. 
		 */		
		public function get y():Number{
			if( this._nativeWindow ) this._bounds.y = this._nativeWindow.y;
			return this._bounds.y;
		}
		public function set y( v:Number ):void{
			if( !this._nativeWindow ) this._bounds.y = v; 
			else this._bounds.y = this._nativeWindow.y = v;
		}
		
		/**
		 * 참조 윈도우의 폭(픽셀)입니다. 
		 */		
		public function get width():Number{
			if( this._nativeWindow ) this._bounds.width = this._nativeWindow.width;
			return this._bounds.width;
		}
		public function set width( v:Number ):void{
			if( !this._nativeWindow ) this._bounds.width = v; 
			else this._bounds.width = this._nativeWindow.width = v;
		}
		
		/**
		 * 참조 윈도우의 높이(픽셀)입니다. 
		 */		
		public function get height():Number{
			if( this._nativeWindow ) this._bounds.height = this._nativeWindow.height;
			return this._bounds.height;
		}
		public function set height( v:Number ):void{
			if( !this._nativeWindow ) this._bounds.height = v;
			else this._bounds.height = this._nativeWindow.height = v;
		}
		
		
		/**
		 * 참조 윈도우의 기본 메뉴입니다. 
		 */		
		public function get menu():NativeMenu{
			if( this._nativeWindow ) this._menu = this._nativeWindow.menu;
			return this._menu;
		}
		public function set menu( v:NativeMenu ):void{
			if( this._nativeWindow ) this._nativeWindow.menu = v;
			this._menu = v;
		}
		
		/**
		 * 참조 윈도우의 최대 크기입니다. 
		 */		
		public function get maxSize():Point{
			if( this._nativeWindow ) this._maxSize.copyFrom( this._nativeWindow.maxSize );
			return this._maxSize.clone();
		}
		public function set maxSize( v:Point ):void{
			if( !this._nativeWindow ) this._maxSize.copyFrom( v );
			else{
				this._nativeWindow.maxSize = v;
				this._maxSize.copyFrom( this._nativeWindow.maxSize );
			}
		}
		
		/**
		 * 참조 윈도우의 최소 크기입니다. 
		 */		
		public function get minSize():Point{
			if( this._nativeWindow ) this._minSize.copyFrom( this._nativeWindow.minSize );
			return this._minSize.clone();
		}
		public function set minSize( v:Point ):void{
			if( !this._nativeWindow ) this._minSize.copyFrom( v );
			else{
				this._nativeWindow.minSize = v;
				this._minSize.copyFrom( this._nativeWindow.minSize );
			}
		}
		
		/**
		 * 참조 윈도우 제목입니다. 
		 */		
		public function get title():String{
			if( this._nativeWindow ) this._title = this._nativeWindow.title;
			return this._title;
		}
		public function set title( v:String ):void{
			if( this._nativeWindow ) this._nativeWindow.title = v;
			this._title = v;
		}
		
		/**
		 * 참조 윈도우의 표시 여부를 지정합니다. 
		 */		
		public function get visible():Boolean{
			if( this._nativeWindow ) this._visible = this._nativeWindow.visible;
			return this._visible;
		}
		public function set visible( v:Boolean ):void{
			if( this._nativeWindow ) this._nativeWindow.visible = v;
			this._visible = v;
		}
		
		
		
		
		//////////////////////////////////////////////////
		// Constructor
		
		public function NativeWindowContext( window:NativeWindow = null, options:NativeWindowInitOptions = null )
		{
			this._bounds = new Rectangle(0,0,400,300);
			
			if( window ){
				this.setNativeWindow( window, false );
			}else{
				if( !options ) options = new NativeWindowInitOptions;
				this.setInitOptions( options );
				this._maxSize = NativeWindow.systemMaxSize.clone();
				this._minSize = NativeWindow.systemMinSize.clone();
			}
		}
		
		
		//////////////////////////////////////////////////
		// Public Methods
		
		public function setSize( width:int, height:int ):void
		{
			this._bounds.width = width;
			this._bounds.height = height;
			if( this._nativeWindow ) this._nativeWindow.bounds = this._bounds;
		}
		
		public function setPosition( x:int, y:int ):void
		{
			this._bounds.x = x;
			this._bounds.y = y;
			if( this._nativeWindow ) this._nativeWindow.bounds = this._bounds;
		}
		
		
		public function copyFromWindow( window:NativeWindow ):void
		{
			this.maximizable = window.maximizable;
			this.minimizable = window.minimizable;
			this.owner = window.owner;
			this.renderMode = window.renderMode;
			this.resizable = window.resizable;
			this.transparent = window.transparent;
			this.type = window.type;
			
			this._alwaysInFront = window.alwaysInFront;
			this._menu = window.menu;
			this._title = window.title;
			this._visible = window.visible;
			
			this._bounds.copyFrom( window.bounds );
			this._maxSize.copyFrom( window.maxSize );
			this._minSize.copyFrom( window.minSize );
		}
		
		public function applyContext( window:NativeWindow ):void
		{
			window.title = this._title;
			window.bounds = this._bounds;
			window.minSize = this._minSize;
			window.maxSize = this._maxSize;
			window.stage.color = this._stageColor;
		}
		
		public function setNativeWindow( window:NativeWindow, applyContext:Boolean = true ):void
		{
			this._nativeWindow = window;
			this.addWindowEvents( this._nativeWindow );
			if( !applyContext ){
				this.maximizable = this._nativeWindow.maximizable;
				this.minimizable = this._nativeWindow.minimizable;
				this.owner = this._nativeWindow.owner;
				this.renderMode = this._nativeWindow.renderMode;
				this.resizable = this._nativeWindow.resizable;
				this.systemChrome = this._nativeWindow.systemChrome;
				this.transparent = this._nativeWindow.transparent;
				this.type = this._nativeWindow.type;
			}else{
				this._nativeWindow.stage.align = this.stageAlign;
				this._nativeWindow.stage.scaleMode = this.stageScaleMode;
				this._nativeWindow.alwaysInFront = this._alwaysInFront;
				if( this.root ) this._nativeWindow.stage.addChild( this.root );
				this.addWindowEvents( this._nativeWindow );
				this.applyContext( this._nativeWindow );
			}
		}
		
		public function getNativeWindow():NativeWindow
		{
			if( !this._nativeWindow ){
				this._nativeWindow = new NativeWindow( this.getInitOptions() );
				this._nativeWindow.stage.align = this.stageAlign;
				this._nativeWindow.stage.scaleMode = this.stageScaleMode;
//				this._nativeWindow.stage.stageWidth = this._bounds.width;
//				this._nativeWindow.stage.stageHeight = this._bounds.height;
				this._nativeWindow.alwaysInFront = this._alwaysInFront;
				if( this.root ) this._nativeWindow.stage.addChild( this.root );
				this.addWindowEvents( this._nativeWindow );
				this.applyContext( this._nativeWindow );
				
			}
			return this._nativeWindow;
		}
		
		public function setInitOptions( options:NativeWindowInitOptions ):void
		{
			this.maximizable = options.maximizable;
			this.minimizable = options.minimizable;
			this.owner = options.owner;
			this.renderMode = options.renderMode;
			this.resizable = options.resizable;
			this.systemChrome = options.systemChrome;
			this.transparent = options.transparent;
			this.type = options.type;
		}
		
		public function getInitOptions():NativeWindowInitOptions
		{
			var options:NativeWindowInitOptions = new NativeWindowInitOptions;
			options.maximizable = this.maximizable;
			options.minimizable = this.minimizable;
			options.resizable = false;
			options.owner = this.owner;
			options.renderMode = this.renderMode;
			options.resizable = this.resizable;
			options.systemChrome = this.systemChrome;
			options.transparent = this.transparent;
			options.type = this.type;
			return options;
		}
		
		public function reload():void
		{
			if( this._nativeWindow && !this._reloadLocking ){
				this.removeWindowEvents( this._nativeWindow );
				var window:NativeWindow = this._nativeWindow;
				this._nativeWindow = null;
				window.close();
				this.getNativeWindow().activate();
			}
		}
		
		private var _reloadLocking:Boolean;
		public function reloadLock():void
		{
			this._reloadLocking = true;
		}
		public function reloadUnlock():void
		{
			this._reloadLocking = false;
			this.reload();
		}
		
		public function addWindowEvents( window:NativeWindow = null ):void
		{
			if( window ){
				window.addEventListener(Event.ACTIVATE, this.onWindowEvent );
				window.addEventListener(Event.CLOSE, this.onWindowEvent );
				window.addEventListener(Event.CLOSING, this.onWindowEvent );
				window.addEventListener(Event.DEACTIVATE, this.onWindowEvent );
				window.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE, this.onWindowEvent );
				window.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING, this.onWindowEvent );
				window.addEventListener(NativeWindowBoundsEvent.MOVE, this.onWindowEvent );
				window.addEventListener(NativeWindowBoundsEvent.MOVING, this.onWindowEvent );
				window.addEventListener(NativeWindowBoundsEvent.RESIZE, this.onWindowEvent );
				window.addEventListener(NativeWindowBoundsEvent.RESIZING, this.onWindowEvent );
				
			}
		}
		public function removeWindowEvents( window:NativeWindow = null ):void
		{
			if( window ){
				window.removeEventListener(Event.ACTIVATE, this.onWindowEvent );
				window.removeEventListener(Event.CLOSE, this.onWindowEvent );
				window.removeEventListener(Event.CLOSING, this.onWindowEvent );
				window.removeEventListener(Event.DEACTIVATE, this.onWindowEvent );
				window.removeEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE, this.onWindowEvent );
				window.removeEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING, this.onWindowEvent );
				window.removeEventListener(NativeWindowBoundsEvent.MOVE, this.onWindowEvent );
				window.removeEventListener(NativeWindowBoundsEvent.MOVING, this.onWindowEvent );
				window.removeEventListener(NativeWindowBoundsEvent.RESIZE, this.onWindowEvent );
				window.removeEventListener(NativeWindowBoundsEvent.RESIZING, this.onWindowEvent );
			}
		}
		
		//////////////////////////////////////////////////
		// Get/Set Methods
		
		
		
		
		
		
		//////////////////////////////////////////////////
		// Private Methods
		
		
		internal var windowHelper:NativeWindowHelper;
		internal function setWindowHelper( helper:NativeWindowHelper ):void
		{
			this.windowHelper = helper;
		}
		
		
		//////////////////////////////////////////////////
		// Event Handlers
		
		private function onWindowEvent( e:Event ):void
		{
			var window:NativeWindow = e.target as NativeWindow;
			if( this.windowHelper ){
				this.windowHelper.windowEventDelegate( e );
			}
			switch( e.type )
			{
				case NativeWindowBoundsEvent.RESIZE:
					this._bounds.copyFrom( window.bounds );
					break;
				case NativeWindowBoundsEvent.MOVE:
					this._bounds.copyFrom( window.bounds );
					break;
				case Event.CLOSE:
					this.removeWindowEvents( window );
					this._nativeWindow = null;
					break;
			}
		}
	}
}








/*
History
# 2016.06.05
- remodeling version
*/
