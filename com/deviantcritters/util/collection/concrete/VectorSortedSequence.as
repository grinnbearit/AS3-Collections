package com.deviantcritters.util.collection.concrete
{
	import com.deviantcritters.util.Collectable;
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.Sequence;
	import com.deviantcritters.util.collection.Stream;
	
	/**An implementation of a sequence using a vector where order is determined
	 * by the compare function passed in*/
	public class VectorSortedSequence extends VectorSequence implements Sequence
	{
		protected var _compare:Function;
		
		public function VectorSortedSequence(compare:Function)
		{
			super();
			_compare = compare;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		override public function add(item:Collectable):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (_compare(vector[i], item) == 1)
				{
					vector.splice(i, 0, item.clone());
					return true;
				}
			vector.push(item.clone());	
			return true;
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		override public function addAll(c:Collection):Boolean
		{
			var s:Stream = c.stream();
			while (s.hasNext())
				add(s.next() as Collectable);
			return true;
		}
	}
}