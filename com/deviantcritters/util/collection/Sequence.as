package com.deviantcritters.util.collection
{
	import com.deviantcritters.util.Collectable;

	/**An interface for collections whose elements are ordered in some way*/
	public interface Sequence extends Collection
	{
		/**Retrieves the item at the position given by index in this collection
		 * @param index, the position to be retrieved
		 * @return the item at the position 'index'
		 * @throws RangeError if index < 0 or index >= this.size()*/
		function takeItemAt(index:uint):Collectable;
		
		/**Removes the item at the position given by index in this collection and returns it
		 * @param index, the position to be removed
		 * @return the item which was removed
		 * @throws RangeError if index < 0 or index >= this.size()*/ 
		function dropItemAt(index:uint):Collectable;
		
		/**Retrieves a sequence of items from the fromIndex(inclusive) to the toIndex(exclusive),
		 * if fromIndex is equal to toIndex, returns an empty sequence
		 * @param fromIndex, the start index (inclusive)
		 * @param toIndex, the end index (exclusive)
		 * @return A sequence of the items from fromIndex to toIndex
		 * @throws RangeError if fromIndex < 0 or toIndex < 0 or fromIndex > this.size() 
		 * or toIndex >= this.size() or fromIndex >= toIndex*/
		function takeRange(fromIndex:uint, toIndex:uint):Sequence;
		
		/**Removes a sequence of items from the fromIndex(inclusive) to the toIndex(exclusive) and
		 * returns it, if fromIndex is equal to toIndex, returns an empty sequence with no changes to
		 * this sequence
		 * @param fromIndex, the start index (inclusive)
		 * @param toIndex, the end index (exclusive)
		 * @return A sequence of the items from fromIndex to toIndex
		 * @throws RangeError if fromIndex < 0 or toIndex < 0 or fromIndex >= this.size() 
		 * or toIndex >= this.size() or fromIndex > toIndex*/
		function dropRange(fromIndex:uint, toIndex:uint):Sequence;
		
		/**Retrieves a sequence of items from the first occurrence of fromItem(inclusive) to the first occurrence
		 * of toItem(exclusive) if fromItem is equal to toItem, returns an empty sequence
		 * @param fromItem, the start item (inclusive)
		 * @param toItem, the end item (exclusive)
		 * @return A sequence of the items from fromItem to toItem
		 * @throws ElementError if fromItem or toItem are not present in this collection
		 * @throws RangeError if toItem appears before fromItem in this collection*/
		function takeSequence(fromItem:Collectable, toItem:Collectable):Sequence;
		
		/**Removes a sequence of items from the first occurrence of fromItem(inclusive) to the first occurrence
		 * of toItem(exclusive) and returns it, if fromItem is equal to toItem, returns an empty sequence
		 * with no change to this collection
		 * @param fromItem, the start item (inclusive)
		 * @param toItem, the end item (exclusive)
		 * @return A sequence of the items from fromItem to toItem
		 * @throws ElementError if fromItem or toItem are not present in this collection
		 * @throws RangeError if toItem appears before fromItem in this collection*/
		function dropSequence(fromItem:Collectable, toItem:Collectable):Sequence;
		
		/**Retrieves a sequence of items from the first item in this collection (head item) to the first occurrence
		 * of toItem(exclusive) if the head item is equal to toItem, returns an empty sequence
		 * @param toItem, the end item (exclusive)
		 * @return A sequence of the items from the head item to toItem
		 * @throws ElementError if toItem is not present*/
		function takeHeadSequence(toItem:Collectable):Sequence;
		
		/**Removes a sequence of items from the first item in this collection (head item) to the first occurrence
		 * of toItem(exclusive) and returns it, if the head item is equal to toItem, returns an empty sequence with
		 * no change to this collection
		 * @param toItem, the end item (exclusive)
		 * @return A sequence of the items from the head item to toItem
		 * @throws ElementError if toItem is not present*/
		function dropHeadSequence(toItem:Collectable):Sequence;
		
		/**Retrieves a sequence of items from the first occurrence of fromItem (inclusive) in this collection to the end
		 * of this sequence, if fromItem is equal to the last element of the sequence returns only the last item in
		 * a sequence
		 * @param fromItem, the start item (inclusive)
		 * @return A sequence of the items from fromItem to the end of this sequence
		 * @throws ElementError if fromItem is not present*/
		function takeTailSequence(fromItem:Collectable):Sequence;
		
		/**Removes a sequence of items from the first occurrence of fromItem (inclusive) in this collection to the end
		 * of this sequence and returns it, if fromItem is equal to the last element of the sequence returns only the last item in
		 * a sequence and removes it
		 * @param fromItem, the start item (inclusive)
		 * @return A sequence of the items from fromItem to the end of this sequence
		 * @throws ElementError if fromItem is not present*/
		function dropTailSequence(fromItem:Collectable):Sequence;
		
		/**Retrieves the first item in this sequence
		 * @return The first item in this sequence
		 * @throws RangeError if this sequence is empty*/ 
		function takeFirst():Collectable;
		
		/**Retrieves the last item in this sequence
		 * @return The last item in this sequence
		 * @throws RangeError if this sequence is empty*/
		function takeLast():Collectable;
		
		/**Removes the first item in this sequence and returns it
		 * @return The first item in this sequence
		 * @throws RangeError if this sequence is empty*/
		function dropFirst():Collectable;
		
		/**Removes the last item in this sequence and returns it
		 * @return The last item in this sequence
		 * @throws RangeError if this sequence is empty*/
		function dropLast():Collectable;
		
		/**Returns the index of the first occurrence of the item passed or -1 if not found in this sequence
		 * @param item, the item whose index is to be found
		 * @return The index of the first occurrence of the item or -1 if the item is not found*/
		function indexOf(item:Collectable):int;
		
		/**Returns the index of the last occurrence of the item passed or -1 if not found in this sequence
		 * @param item, the item whose index is to be found
		 * @return The index of the last occurrence of the item or -1 if the item is not found*/
		function lastIndexOf(item:Collectable):int;
	}
}