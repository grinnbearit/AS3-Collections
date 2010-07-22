package com.deviantcritters.util.collection
{
	import com.deviantcritters.util.Collectable;

	/**An interface for streams which can be lazy or eager*/
	public interface Stream
	{
		/**Returns the next item in this stream and moves the stream forward
		 * @return The next item in this stream
		 * @throws StreamError if the stream has ended*/
		function next():Object;
		
		/**Checks if the stream has ended
		 * @return True if the stream has not ended false otherwise*/
		function hasNext():Boolean;
		
		/**Modifies this stream to have only the next n items or less if if the stream has
		 * fewer than n items
		 * @param n, the number of items to be retained
		 * @return this stream*/ 
		function take(n:uint):Stream;
		
		/**Modifies this stream by dropping the next n items and returns it, if the stream
		 * has less than n items then it empties it
		 * @param n, the number of items to be dropped
		 * @return this stream*/
		function drop(n:uint):Stream;
		
		/**Modifies this stream to have only the items which consecutively satisfy the passed function
		 * @param fn, the predicate function to be tested against
		 * @return this stream*/ 
		function takeWhile(fn:Function):Stream;
		
		/**Modifies this stream by dropping the items which consecutively satisfy the passed function
		 * @param fn, the predicate function to be tested against
		 * @return this stream*/
		function dropWhile(fn:Function):Stream;
		
		/**Modifies this stream by returning the stream of items after applying the passed function on them,
		 * more streams can be passed whose items are used as additional arguments to the function
		 * @param fn, the tranformation function
		 * @param ...seqs, the additional seqs to be passed as arguments
		 * @return this stream*/
		function map(fn:Function, ...seqs):Stream;
		
		/**Modifies this stream by returning only those items which satisfy the passed predicate function
		 * @param the predicate function
		 * @return this stream*/
		function filter(fn:Function):Stream;
		
		/**Reduces this stream to a single object by applying the passed function to the first 2 items in this
		 * sequence, then the result and the next item and so on till the stream ends. If start is not null
		 * its treated as the first argument in the first reduction, if end is not null its treated as
		 * the second argument in the last reduction
		 * @param fn, the reduction function
		 * @param start, if not null, the first argument in the first reduction
		 * @param end, if not null, the second argument in the last reduction
		 * @return the object which this stream has been reduced to*/
		function reduce(fn:Function, start:Object = null, end:Object = null):Object;
	}
}