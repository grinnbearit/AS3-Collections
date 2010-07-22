package com.deviantcritters.util.collection.concrete
{
	import com.deviantcritters.util.Collectable;
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.Set;
	import com.deviantcritters.util.collection.Stream;
	
	/**An implementation of a set using a vector*/
	public class VectorSet extends VectorCollection implements Set
	{
		public function VectorSet()
		{
			super();
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		override public function add(item:Collectable):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i].equals(item))
					return false;
			return super.add(item);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		override public function addAll(c:Collection):Boolean
		{
			var s:Stream = c.stream();
			var result:Boolean = false;
			while (s.hasNext())
				result = add(s.next() as Collectable) || result;
			return result;
		}
	}
}