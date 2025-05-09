﻿package com.admobutils 
{

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import com.Command;

	/** Simple Button */
	class SimpleButton extends Sprite
	{
		//
		// Instance Variables
		//
		
		/** Command */
		private var cmd:Command;
		
		/** Width */
		private var _width:Number;
		
		/** Label */
		private var txtLabel:TextField;
		
		//
		// Public Methods
		//
		
		/** Create New SimpleButton */
		public function SimpleButton(cmd:Command)
		{
			super();
			this.cmd=cmd;
			
			mouseChildren=false;
			mouseEnabled=buttonMode=useHandCursor=true;
			
			txtLabel=new TextField();
			txtLabel.defaultTextFormat=new TextFormat("Arial",32,0xFFFFFF);
			txtLabel.mouseEnabled=txtLabel.mouseEnabled=txtLabel.selectable=false;
			txtLabel.text=cmd.getLabel();
			txtLabel.autoSize=TextFieldAutoSize.LEFT;
			
			redraw();
			
			addEventListener(MouseEvent.CLICK,onSelect);
		}
		
		/** Set Width */
		override public function set width(val:Number):void
		{
			this._width=val;
			redraw();
		}

		
		/** Dispose */
		public function dispose():void
		{
			removeEventListener(MouseEvent.CLICK,onSelect);
		}
		
		//
		// Events
		//
		
		/** On Press */
		private function onSelect(e:MouseEvent):void
		{
			this.cmd.execute();

			this.removeEventListener(MouseEvent.CLICK,onSelect);
		}
		
		//
		// Implementation
		//
		
		/** Redraw */
		private function redraw():void
		{		
			this.txtLabel.text=cmd.getLabel();
			_width=_width||txtLabel.width*1.1;
			
			graphics.clear();
			graphics.beginFill(0x444444);
			graphics.lineStyle(2,0);
			graphics.drawRoundRect(0,0,_width,txtLabel.height*1.1,txtLabel.height*.4);
			graphics.endFill();
			
			this.txtLabel.x=_width/2-(txtLabel.width/2);
			this.txtLabel.y=txtLabel.height*.05;
			addChild(txtLabel);
			
		}
	}
}