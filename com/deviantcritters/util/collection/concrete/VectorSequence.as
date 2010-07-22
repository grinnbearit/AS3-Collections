package com.deviantcritters.util.collection.concrete
{
	import com.deviantcritters.util.Collectable;
	import com.deviantcritters.util.collection.ElementError;
	import com.deviantcritters.util.collection.Sequence;
	
	/**An implementation of a sequence using a vector where order is determined
	 * by order of insertion*/
	public class VectorSequence extends VectorCollection implements Sequence
	{
		public function VectorSequence()
		{
			super();
		}
		
		protected function checkIndex(index:uint):void
		{
			if (index >= vector.length || index < 0)
				throw new RangeError("index(" + index + ") out of range(" + vector.length + ")");
		}
		
		protected function checkRange(fromIndex:uint, toIndex:uint):void
		{
			checkIndex(fromIndex);
			if (toIndex > vector.length || toIndex < 0)
				throw new RangeError("index(" + toIndex + ") out of range(" + (vector.length + 1) + ")");
			if (fromIndex > toIndex)
				throw new RangeError("fromIndex(" + fromIndex + ") > toIndex(" + toIndex + ")");
		}
		
		protected function checkElement(element:Collectable):uint
		{
			var index:uint = indexOf(element);
			if (index < 0)
				throw new ElementError("element(" + element + ") not found");
			return index;
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function takeItemAt(index:uint):Collectable
		{
			checkIndex(index);
			return vector[index].clone();
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function dropItemAt(index:uint):Collectable
		{
			checkIndex(index);
			var c:Collectable = vector[index];
			vector.splice(index, 1);
			return c;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function takeRange(fromIndex:uint, toIndex:uint):Sequence
		{
			checkRange(fromIndex, toIndex);
			var seq:Sequence = new VectorSequence();
			for (var i:uint = fromIndex; i < toIndex; i++)
				seq.add(vector[i]);
			return seq;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function dropRange(fromIndex:uint, toIndex:uint):Sequence
		{
			var seq:Sequence = takeRange(fromIndex, toIndex);
			vector.splice(fromIndex, toIndex - fromIndex);
			return seq;
		}
		
		/**O(n^3)
		 * @inheritDoc
		 * */
		public function takeSequence(fromElement:Collectable, toElement:Collectable):Sequence
		{
			var fromIndex:uint = checkElement(fromElement);
			var toIndex:uint = checkElement(toElement);
			return takeRange(fromIndex, toIndex);
		}
		
		/**O(n^3)
		 * @inheritDoc
		 * */
		public function dropSequence(fromElement:Collectable, toElement:Collectable):Sequence
		{
			var fromIndex:uint = checkElement(fromElement);
			var toIndex:uint = checkElement(toElement);
			return dropRange(fromIndex, toIndex);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function takeHeadSequence(toElement:Collectable):Sequence
		{
			var toIndex:uint = checkElement(toElement);
			return takeRange(0, toIndex);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function dropHeadSequence(toElement:Collectable):Sequence
		{
			var toIndex:uint = checkElement(toElement);
			return dropRange(0, toIndex);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function takeTailSequence(fromElement:Collectable):Sequence
		{
			var fromIndex:uint = checkElement(fromElement);
			return takeRange(fromIndex, vector.length);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function dropTailSequence(fromElement:Collectable):Sequence
		{
			var fromIndex:uint = checkElement(fromElement);
			return dropRange(fromIndex, vector.length);
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function takeFirst():Collectable
		{
			if (vector.length == 0)
				throw new RangeError("sequence is Empty");
			return vector[0].clone();
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function takeLast():Collectable
		{
			if (vector.length == 0)
				throw new RangeError("sequence is Empty");
			return vector[vector.length - 1].clone();
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function dropFirst():Collectable
		{
			if (vector.length == 0)
				throw new RangeError("sequence is Empty");
			return vector.shift();
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function dropLast():Collectable
		{
			if (vector.length == 0)
				throw new RangeError("sequence is Empty");
			return vector.pop();
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function indexOf(item:Collectable):int
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i].equals(item))
					return i;
			return -1;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function lastIndexOf(item:Collectable):int
		{
			for (var i:uint = vector.length - 1; i >= 0; i--)
				if (vector[i].equals(item))
					return i;
			return -1;
		}
	}
}