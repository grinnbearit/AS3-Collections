package com.deviantcritters.util.collection.concrete
{
	import com.deviantcritters.util.Collectable;
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.List;
	import com.deviantcritters.util.collection.Stream;
	
	/**An implementation of a list using a vector*/
	public class VectorList extends VectorSequence implements List
	{
		public function VectorList()
		{
			super();
		}
		
		protected function checkInsertIndex(index:uint):void
		{
			if (index != vector.length)
				checkIndex(index);
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function insert(index:uint, item:Collectable):void
		{
			checkInsertIndex(index);
			vector.splice(index, 0, item.clone());  
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function insertAll(index:uint, c:Collection):void
		{
			checkInsertIndex(index);
			var acc:Array = c.toArray();
			acc.splice(0, 0, index, 0);
			vector.splice.apply(null, acc);
		}
		
		/**O(1)
		 * @inheritDoc
		 * */
		public function update(index:uint, item:Collectable):Collectable
		{
			checkIndex(index);
			var c:Collectable = vector[index];
			vector[index] = item.clone();
			return c;
		}
	}
}