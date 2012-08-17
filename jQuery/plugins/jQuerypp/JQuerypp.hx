package jQuery.plugins.jQuerypp;

import js.Dom;
import jQuery.JQuery;

/*
	TODO:
		events: default, key, pause, resize
*/

#if JQUERY_NOCONFLICT
@:native("jQuery")
#else
@:native("$")
#end
extern class JQuerypp extends JQuery
{
	inline static var COMPARE_IDENTICAL = 0;
	inline static var COMPARE_DIFFERENT_DOCUMENTS = 1;
	inline static var COMPARE_B_PRECEDES_A = 2;
	inline static var COMPARE_A_PRECEDES_B = 4;
	inline static var COMPARE_B_CONTAINS_A = 8;
	inline static var COMPARE_A_CONTAINS_B = 16;
	/**
	jQuery.compare adds $.fn.compare to compare the position of two nodes. It returns a number that represents a bitmask showing how they are positioned relative to each other. 
	**/
	function compare(b : js.JQuery) : Int;
	/**
	jQuery.cookie packages Klaus Hartl’s jQuery cookie plugin for manipulating cookies. 
	**/
	@:overload(function(name : String) : String {})
	@:overload(function(name : String, value : String, ?options : { ?expires : Date, ?domain : String, ?path : String, ?secure : Bool }) : Void {})
	static function cookie(name : String, value : String, ?options : { ?expires : Int, ?domain : String, ?path : String, ?secure : Bool }) : Void;

	@:overload(function(height : Float) : Void {})
	override function innerHeight() : Int;

	@:overload(function(height : Float, ?includeMargin : Bool) : Void {})
	override function outerHeight(?includeMargin : Bool) : Int;

	@:overload(function(width : Float) : Void {})
	override function innerWidth() : Int;

	@:overload(function(width : Float, ?includeMargin : Bool) : Void {})
	override function outerWidth(?includeMargin : Bool) : Int;

	/**
	jQuery.formParams adds $.fn.formParams which serializes a form into a JavaScript object. It creates nested objects by using bracket notation in the form element name. If convert is true, values that look like numbers or booleans will be converted and empty strings won’t be added to the object.
	**/
	@:overload(function(?convert : Bool) : {} {})
	function formParams(values : {}) : JQuerypp;

	/**
	Use jQuery.Range to create, move and compare text ranges. Use $.Range.current() to get the currently selected text range. $(el).range() returns a text range on an element.
	**/
	function range() : RangeAPI;

	/**
	Adds $.fn.selection to set or retrieve the currently selected text range. It works on all elements.
	**/
	@:overload(function(start : Int, end : Int) : JQuerypp {})
	function selection() : { start : Int, end : Int };

	/**
	Adds $.fn.styles as a fast way of getting a set of computed styles from an element. It performs much faster than retrieving them individually e.g. by using jQuery.css(). Computed styles reflect the actual current style of an element, including browser defaults and CSS settings.
	**/
	function styles(s1 : String, ?s2 : String, ?s3 : String, ?s4 : String, ?s5 : String, ?s6 : String, ?s7 : String, ?s8 : String) : Dynamic;

	/**
	Adds $.fn.within and $.fn.withinBox that return all elements having a given position or area in common.
	**/
//	@:overload(function() :  {})
	function within(x : Int, y : Int) : Bool;
	function withinBox(x : Int, y : Int, width : Float, height : Float) : Bool;

	// EVENTS

	/**
	the mouse cursor is pressed down
	**/
	function dragdown(handler : Event -> DragAPI -> Void) : JQuerypp;

	/**
	the drag motion is started
	**/
	function draginit(handler : Event -> DragAPI -> Void) : JQuerypp;

	/**
	the drag is moved
	**/
	function dragmove(handler : Event -> DragAPI -> Void) : JQuerypp;

	/**
	the drag has ended
	**/
	function dragend(handler : Event -> DragAPI -> Void) : JQuerypp;

	/**
	the drag is over a drop point
	**/
	function dragover(handler : Event -> DragAPI -> Void) : JQuerypp;

	/**
	the drag moved out of a drop point
	**/
	function dragout(handler : Event -> DragAPI -> Void) : JQuerypp;

	/**
	Adds a destroyed event that is triggered when an element has been removed.
	**/
	function destroyed(handler : Void -> Void) : JQuerypp;

	/**
	The drag motion is started, drop positions are calculated.
	**/
	function dropinit(handler : Event -> DropAPI -> DragAPI -> Void) : Void;

	/**
	A drag moves over a drop element, called once as the drop is dragged over the element.
	**/
	function dropover(handler : Event -> DropAPI -> DragAPI -> Void) : Void;

	/**
	A drag moves out of the drop element.
	**/
	function dropout(handler : Event -> DropAPI -> DragAPI -> Void) : Void;

	/**
	A drag is moved over a drop element, called repeatedly as the element is moved.
	**/
	function dropmove(handler : Event -> DropAPI -> DragAPI -> Void) : Void;

	/**
	A drag is released over a drop element.
	**/
	function dropon(handler : Event -> DropAPI -> DragAPI -> Void) : Void;

	/**
	The drag motion has completed.
	**/
	function dropend(handler : Event -> DropAPI -> DragAPI -> Void) : Void;

	/**
	called on mouseenter
	**/
	function hoverinit(handler : Event -> HoverAPI -> Void) : Void;

	/**
	an element is being hovered
	**/
	function hoverenter(handler : Event -> HoverAPI -> Void) : Void;

	/**
	the mouse moves on an element that has been hovered
	**/
	function hovermove(handler : Event -> HoverAPI -> Void) : Void;

	/**
	the mouse leaves the hovered element
	**/
	function hoverleave(handler : Event -> HoverAPI -> Void) : Void;

	/**
	adds support for swipe motions providing the delegatable swipeleft, swiperight, swipedown, swipeup and swipe events
	**/
	function swipe(handler : Event -> Void) : JQuerypp;
	function swipeleft(handler : Event -> Void) : JQuerypp;
	function swiperight(handler : Event -> Void) : JQuerypp;
	function swipeup(handler : Event -> Void) : JQuerypp;
	function swipedown(handler : Event -> Void) : JQuerypp;

	inline static function pp(jQ : js.JQuery) : JQuerypp untyped { return jQ; }
}

extern class HoverAPI {
	/**
	sets the delay (in ms) for this hover.
	**/
	function delay(val : Int) : HoverAPI;

	/**
	sets the maximum distance (in pixels) the mouse is allowed to travel in order to activate
	**/
	function distance(val : Int) : HoverAPI;

	/**
	sets a delay for how long the hover should stay active after the mouse left.
	**/
	function leave(val : Int) : HoverAPI;
}

extern class DropAPI {
	/**
	Sets the drop to cache positions of draggable elements. This should be called in dropinit.
	**/
	function cache() : Void;
	/**
	Prevents this drop from being dropped on.
	**/
	function cancel() : Void;

	/**
	Gets all elements that are droppable and adds them to a list.

	This should be called if and when new drops are added to the page during the motion of a single drag.

	This is called by default when a drag motion starts.
	**/
	static function compile(?event : Event, ?drag : DragAPI) : Void;
}

extern class DragAPI {
	/**
	Stops a drag motion from from running. This also stops any other events from firing, meaning that "dragend" will not be called.
	**/
	function cancel() : Void;

	/**
	sets or reads the distance the mouse must move before a drag motion is started. This should be set in "dragdown" and delays "draginit" being called until the distance is covered. The distance is measured in pixels. The default distance is 0 pixels meaning the drag motion starts on the first mousemove after a mousedown.
	**/
	@:overload(function(val : Float) : DragAPI {})
	function distance() : Int;

	/**
	clones the element and uses it as the moving element, leaving the original dragged element in place. The parent option can be used to specify where the ghost element should be temporarily added into the DOM. This method should be called in "draginit".
	**/
	function ghost(?parent : HtmlDom) : JQuerypp;

	/**
	isolates the drag to horizontal movement. Call horizontal() in "draginit" or "dragdown".
	**/
	function horizontal() : DragAPI;

	/**
	is a vector specifying where the element should be in the page. This takes into account the start position of the cursor on the element.

	If the drag is going to be moved to an unacceptable location, you can call preventDefault in dragmove to prevent it from being moved there.
	**/
	var location : VectorAPI;

	/**
	The position of start of the cursor on the element
	**/
	function mouseElementPosition() : VectorAPI;

	/**
	Indicates if you only want a drag motion and the drag should not notify drops. The default value is false. Call it with no arguments or pass it true to prevent drop events.
	**/
	@:overload(function(value : Bool) : DragAPI {})
	function only() : Bool;

	/**
	Tells the drag motion to use a different element than the one that began the drag motion.

	For example, instead of dragging an drag-icon of a todo element, you want to move some other representation of the todo element (or elements).
	**/
	function representative(element : HtmlDom, ?offsetX : Float, ?offsetY : Float) : DragAPI;

	/**
	Makes the representative element revert back to it original position after the drag motion has completed. The revert is done with an animation.
	**/
	function revert(?val : Bool) : DragAPI;

	/**
	isolates the drag to vertical movement. Call vertical() in "draginit" or "dragdown".
	**/
	function vertical() : DragAPI;

	/**
	Limits a drag to a containing element.
	"center" can set the limit to the center of the object. Can be 'x', 'y' or 'both'. By default it will keep the outer edges of the moving element within the container element. If you provide x, it will keep the horizontal center of the moving element within the container element. If you provide y, it will keep the vertical center of the moving element within the container element. If you provide both, it will keep the center of the moving element within the containing element.
	**/
	function limit(container : JQuery, ?center : String) : DragAPI;

	/**

	**/
//	@:overload(function() :  {})
	function scrolls(elements : JQuery, ?options : { ?distance : Float, ?delta : Float -> Float, ?direction : String }) : Void;
}

extern class VectorAPI {
	function app(handler : Float -> Float) : VectorAPI;
	@:overload(function(x : Float, y : Float) : Bool {})
	function plus(other : VectorAPI) : Bool;
	@:overload(function(x : Float, y : Float) : Bool {})
	function minus(other : VectorAPI) : Bool;
	@:overload(function(x : Float, y : Float) : Bool {})
	function equals(other : VectorAPI) : Bool;
	function y() : Float;
	function top() : Float;
	function height() : Float;
	function x() : Float;
	function left() : Float;
	function width() : Float;
	function update(val : Array<Float>) : VectorAPI;
	function toString() : String;
}

extern class RangeAPI {
	static inline var START_TO_START = "START_TO_START";
	static inline var START_TO_END = "START_TO_END";
	static inline var END_TO_END = "END_TO_END";
	static inline var END_TO_START = "END_TO_START";
	function clone() : RangeAPI;
	/**
	Collapses a range to one of its boundary points.
	**/
	function collapse(?toStart : Bool) : RangeAPI;
	/**
	Compares one range to another range.
	**/
	function compare(type : String, compareRange : RangeAPI) : Int;

	/**
	Gets or sets the end of the range.
	**/
	@:overload(function(offset : String) : Void {})
	@:overload(function(offset : Int) : Void {})
	function end() : { container : HtmlDom, offset : Int };

	/**
	Gets or sets the start of the range.
	**/
	@:overload(function(offset : String) : Void {})
	@:overload(function(offset : Int) : Void {})
	function start() : { container : HtmlDom, offset : Int };

	/**
	Moves the endpoints of a range relative to another range.
	**/
	function move(type : String, referenceRange : RangeAPI) : RangeAPI;

	/**
	Returns true if any portion of these two ranges overlap.
	**/
	function overlaps(range : RangeAPI) : Bool;

	/**
	Returns the most common ancestor element of the endpoints in the range. This will return a text element if the range is within a text element.
	**/
	function parent() : HtmlDom;

	/**
	Returns the bounding rectangle of this range.
	**/
	function rect(?from : String) : { x : Int, y : Int, width : Int, height : Int };

	/**
	Returns the client rects.
	**/
	@:overload(function(from : String) : Void {})
	function rects() : String;
	/**
	Returns the text of the range.
	**/
	function toString() : String;
}