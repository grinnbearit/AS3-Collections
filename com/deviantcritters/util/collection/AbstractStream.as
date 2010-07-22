package com.deviantcritters.util.collection
{
	/**A class which can be subclassed by streams and provides implementations of
	 * take, drop, takeWhile, dropWhile, map, filter, reduce as well as caches the return
	 * values of hasNext and next. The extending stream should override the _next and _hasNext methods*/
	public class AbstractStream implements Stream
	{
		private var streamControl:StreamControl;
		
		public function AbstractStream()
		{
			var nextFn:Function = function():Object {return _next()};
			var hasNextFn:Function = function():Boolean {return _hasNext()};
			streamControl = new StreamControl(nextFn, hasNextFn);
		}
		
		protected function _next():Object
		{
			throw new StreamError();
		}
		
		protected function _hasNext():Boolean
		{
			return false;
		}
		
		public final function next():Object
		{
			return streamControl.nextFn();
		}
		
		public final function hasNext():Boolean
		{
			return streamControl.hasNextFn();
		}
		
		public function take(n:uint):Stream
		{
			var sc:StreamControl = streamControl;
			var count:uint = n; 
			var nextFn:Function = 
				function():Object
				{
					var o:Object = sc.nextFn();
					count--;
					return o;
				}
			var hasNextFn:Function =
				function():Boolean
				{
					return count != 0 && sc.hasNextFn();
				}
				streamControl = new StreamControl(nextFn, hasNextFn);
				return this;
		}
		
		public function drop(n:uint):Stream
		{
			for (var i:uint = 0; i < n && streamControl.hasNextFn(); i++)
				streamControl.nextFn();
			return this;
		}
		
		public function takeWhile(fn:Function):Stream
		{
			var sc:StreamControl = streamControl;
			var nextItem:Object = null;
			var ended:Boolean = false;
			var nextFn:Function =
				function():Object
				{
					var o:Object = nextItem;
					nextItem = null;
					return o;
				}
			var hasNextFn:Function =
				function():Boolean
				{
					if (ended)
						return false;
					if (!sc.hasNextFn())
					{
						ended = true;
						return false;
					}
					if (nextItem == null)
						nextItem = sc.nextFn();
					if (fn(nextItem))
						return true;
					ended = true;
					return false;
				}
			streamControl = new StreamControl(nextFn, hasNextFn);
			return this;
		}
		
		public function dropWhile(fn:Function):Stream
		{
			var sc:StreamControl = streamControl;
			var o:Object;
			var found:Boolean = false;
			var called:Boolean = false;
			while (sc.hasNextFn())
			{
				o = sc.nextFn();
				if (!fn(o))
				{
					found = true;
					break;
				}
			}
			if (!found)
				return this;
			var nextFn:Function =
				function():Object
				{
					if (called)
						return sc.nextFn();
					called = true;
					return o;
				}
			var hasNextFn:Function = 
				function():Boolean
				{
					if (called)
						return sc.hasNextFn();
					return true;
				}
			streamControl = new StreamControl(nextFn, hasNextFn); 
			return this;
		}
		
		public function map(fn:Function, ...seqs):Stream
		{
			var sc:StreamControl = streamControl;
			var hasNextFn:Function =
				function():Boolean
				{
					var result:Boolean = sc.hasNextFn();
					for (var i:uint = 0; i < seqs.length; i++)
						result = (seqs[i] as Stream).hasNext() && result;
					return result;
				}
			var nextFn:Function =
				function():Object
				{
					var array:Array = [sc.nextFn()];
					for (var i:uint = 0; i < seqs.length; i++)
						array.push((seqs[i] as Stream).next());
					return fn.apply(null, array);	
				}
			streamControl = new StreamControl(nextFn, hasNextFn); 
			return this;
		}
		
		public function filter(fn:Function):Stream
		{
			var sc:StreamControl = streamControl;
			var nextItem:Object = null;
			var nextFn:Function =
				function():Object
				{
					var o:Object = nextItem;
					nextItem = null;
					return o;
				}
			var hasNextFn:Function =
				function():Boolean
				{
					if (nextItem != null)
						return true;
					var o:Object;
					while (sc.hasNextFn())
					{
						o = sc.nextFn();
						if (fn(o))
						{
							nextItem = o;
							return true;
						}
					}
					return false;
				}
			streamControl = new StreamControl(nextFn, hasNextFn);
			return this;
		}
		
		public function reduce(fn:Function, start:Object=null, end:Object=null):Object
		{
			if (!streamControl.hasNextFn())
				return fn(start, end);
			var o:Object = start != null ? start : streamControl.nextFn();
			while (streamControl.hasNextFn())
				o = fn(o, streamControl.nextFn());
			if (end != null)
				o = fn(o, end);
			return o;
		}
	}
}
import com.deviantcritters.util.collection.StreamError;

class StreamControl
{
	private var _nextFn:Function;
	private var _hasNextFn:Function;
	
	public function StreamControl(nextFn:Function, hasNextFn:Function)
	{
		var cachedHasNext:Boolean = false;
		var hasNextCache:Boolean = false;
		_nextFn = 
			function():Object
			{
				if (_hasNextFn())
				{
					cachedHasNext = false;
					return nextFn();
				}
				throw new StreamError();
			}
		_hasNextFn = 
			function():Boolean
			{
				if (cachedHasNext)
					return hasNextCache;
				hasNextCache = hasNextFn();
				cachedHasNext = true;
				return hasNextCache;
			}
	}
	
	public function get nextFn():Function
	{
		return _nextFn;
	}
	
	public function get hasNextFn():Function
	{
		return _hasNextFn;
	}
}