package com.deviantcritters.util.collection
{
	import com.deviantcritters.util.Collectable;

	/**An interface for sequences whose elements are ordered by their index*/
	public interface List extends Sequence
	{
		/**Inserts an item in this list at the the passed index
		 * @param index, the index which the item should have in this list
		 * @param item, the item to be inserted into this list
		 * @throws RangeError if index < 0 or index > this.size()*/
		function insert(index:uint, item:Collectable):void;
		
		/**Inserts all items in the passed collection at the the passed index
		 * @param index, the index which the first item in the passed collection should have in this list
		 * @param c, the collection to be inserted in this list
		 * @throws RangeError if index < 0 or index > this.size()*/
		function insertAll(index:uint, c:Collection):void;
		
		/**Replaces an item in this list at the passed index by the passed item and returns its old value
		 * @param index, the index which should be updated
		 * @param item, the item which should replace the old item at the passed index
		 * @return The old value at the passed index
		 * @throws RangeError if index < 0 or index >= this.size()*/
		function update(index:uint, item:Collectable):Collectable;
	}
}