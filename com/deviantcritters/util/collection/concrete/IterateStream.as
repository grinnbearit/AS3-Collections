package com.deviantcritters.util.collection.concrete
{
	import com.deviantcritters.util.collection.AbstractStream;

	/**An infinite stream which returns consecutive applications of a function 
	 * on a seed object*/
	public class IterateStream extends AbstractStream
	{
		protected var result:Object;
		protected var fn:Function;
		private var firstCall:Boolean;
		
		public function IterateStream(fn:Function, initialValue:Object)
		{
			super();
			result = initialValue;
			this.fn = fn;
			firstCall = true;
		}
		
		override protected function _next():Object
		{
			if (firstCall)
			{
				firstCall = false;
				return result
			}
			result = fn(result);
			return result;
		}
		
		override protected function _hasNext():Boolean
		{
			return true;
		}
	}
}