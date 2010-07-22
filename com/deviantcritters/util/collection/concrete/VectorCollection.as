package com.deviantcritters.util.collection.concrete
{
	import com.deviantcritters.util.Collectable;
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.Stream;
	
	/**An implementation of a collection using a vector*/
	public class VectorCollection implements Collection
	{
		protected var vector:Vector.<Collectable>;
		
		public function VectorCollection()
		{
			vector = new Vector.<Collectable>();
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function add(item:Collectable):Boolean
		{
			vector.push(item.clone());
			return true;
		}
		
		/** O(n)
		 * @inheritDoc
		 * */
		public function addAll(c:Collection):Boolean
		{
			vector.push.apply(null, c.toArray()); 
			return true;
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function clear():void
		{
			vector = new Vector.<Collectable>();
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function contains(item:Collectable):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i].equals(item))
					return true;
			return false;
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function containsAll(c:Collection):Boolean
		{
			var s:Stream = c.stream();
			var result:Boolean = true;
			while (s.hasNext())
				result = contains(s.next() as Collectable) && result;
			return result;
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function isEmpty():Boolean
		{
			return vector.length == 0;
		}
		
		public function stream():Stream
		{
			return new VectorStream(vector);
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function remove(item:Collectable):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i].equals(item))
				{
					vector.splice(i, 1);
					return true;
				}
			return false;
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function removeAll(c:Collection):Boolean
		{
			var result:Boolean = false;
			var s:Stream = c.stream();
			while (s.hasNext())
				result = remove(s.next() as Collectable) || result;
			return result;
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function retainAll(c:Collection):Boolean
		{
			var result:Boolean = false;
			for (var i:uint = 0; i < vector.length; i++)
				if (!c.contains(vector[i]))
				{
					result = true;
					vector.splice(i--, 1);
				}
			return result;
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function get size():uint
		{
			return vector.length;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function toArray():Array
		{
			var array:Array = new Array();
			for (var i:uint = 0; i < vector.length; i++)
				array.push(vector[i].clone());
			return array;
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function equals(c:Collectable):Boolean
		{
			var coll:Collection = c as Collection;
			if (coll == null)
				return false;
			return vector.length == coll.size && containsAll(coll);
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function clone():Collectable
		{
			var vc:VectorCollection = new VectorCollection();
			for (var i:uint = 0; i < vector.length; i++)
				vc.add(vector[i]);
			return vc;
		}
		
		public function toString():String
		{
			return vector.toString();
		}
	}
}
import com.deviantcritters.util.Collectable;
import com.deviantcritters.util.collection.StreamError;
import com.deviantcritters.util.collection.AbstractStream;

class VectorStream extends AbstractStream
{
	private var vector:Vector.<Collectable>;
	private var index:uint = 0;
	
	public function VectorStream(vector:Vector.<Collectable>)
	{
		this.vector = vector;
	}
	
	override protected function _next():Object
	{
		return vector[index++].clone()
	}
	
	override protected function _hasNext():Boolean
	{
		return index < vector.length;
	}
}