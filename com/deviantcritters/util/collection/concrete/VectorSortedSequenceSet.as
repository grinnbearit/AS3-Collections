package com.deviantcritters.util.collection.concrete
{
	import com.deviantcritters.util.Collectable;
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.SequenceSet;
	import com.deviantcritters.util.collection.Stream;
	
	/**An implementation of a sequenceset using a vector where order is determined by the
	 * compare function*/
	public class VectorSortedSequenceSet extends VectorSortedSequence implements SequenceSet
	{
		public function VectorSortedSequenceSet(compare:Function)
		{
			super(compare);
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		override public function add(item:Collectable):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
			{
				var result:int = _compare(vector[i], item);
				if (result == 0)
					return false;
				if (result == 1)
				{
					vector.splice(i, 0, item.clone());
					return true;
				}
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
			var result:Boolean = false;
			while (s.hasNext())
				result = add(s.next() as Collectable) || result;
			return result;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function takeRangeSet(fromIndex:uint, toIndex:uint):SequenceSet
		{
			var sortedSet:SequenceSet = new VectorSortedSequenceSet(_compare);
			for (var i:uint = fromIndex; i < toIndex; i++)
				sortedSet.add(vector[i]);
			return sortedSet;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function dropRangeSet(fromIndex:uint, toIndex:uint):SequenceSet
		{
			var sortedSet:SequenceSet = takeRangeSet(fromIndex, toIndex);
			vector.splice(fromIndex, toIndex - fromIndex);
			return sortedSet;
		}
		
		/**O(n^3)
		 * @inheritDoc
		 * */
		public function takeSet(fromElement:Collectable, toElement:Collectable):SequenceSet
		{
			var fromIndex:uint = checkElement(fromElement);
			var toIndex:uint = checkElement(toElement);
			return takeRangeSet(fromIndex, toIndex);
		}
		
		/**O(n^3)
		 * @inheritDoc
		 * */
		public function dropSet(fromElement:Collectable, toElement:Collectable):SequenceSet
		{
			var fromIndex:uint = checkElement(fromElement);
			var toIndex:uint = checkElement(toElement);
			return dropRangeSet(fromIndex, toIndex);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function takeHeadSet(toElement:Collectable):SequenceSet
		{
			var toIndex:uint = checkElement(toElement);
			return takeRangeSet(0, toIndex);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function dropHeadSet(toElement:Collectable):SequenceSet
		{
			var toIndex:uint = checkElement(toElement);
			return dropRangeSet(0, toIndex);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function takeTailSet(fromElement:Collectable):SequenceSet
		{
			var fromIndex:uint = checkElement(fromElement);
			return takeRangeSet(fromIndex, vector.length);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function dropTailSet(fromElement:Collectable):SequenceSet
		{
			var fromIndex:uint = checkElement(fromElement);
			return dropRangeSet(fromIndex, vector.length);
		}
	}
}