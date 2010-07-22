package com.deviantcritters.util.collection
{
	import com.deviantcritters.util.Collectable;

	/**An interface for sets which also maintain order*/
	public interface SequenceSet extends Sequence, Set
	{
		/**Retrieves a SequenceSet of items from the fromIndex(inclusive) to the toIndex(exclusive),
		 * if fromIndex is equal to toIndex, returns an empty SequenceSet
		 * @param fromIndex, the start index (inclusive)
		 * @param toIndex, the end index (exclusive)
		 * @return A SequenceSet of the items from fromIndex to toIndex
		 * @throws RangeError if fromIndex < 0 or toIndex < 0 or fromIndex > this.size() 
		 * or toIndex >= this.size() or fromIndex >= toIndex*/
		function takeRangeSet(fromIndex:uint, toIndex:uint):SequenceSet;
		
		/**Removes a SequenceSet of items from the fromIndex(inclusive) to the toIndex(exclusive) and
		 * returns it, if fromIndex is equal to toIndex, returns an empty SequenceSet with no changes to
		 * this SequenceSet
		 * @param fromIndex, the start index (inclusive)
		 * @param toIndex, the end index (exclusive)
		 * @return A SequenceSet of the items from fromIndex to toIndex
		 * @throws RangeError if fromIndex < 0 or toIndex < 0 or fromIndex >= this.size() 
		 * or toIndex >= this.size() or fromIndex > toIndex*/
		function dropRangeSet(fromIndex:uint, toIndex:uint):SequenceSet;
		
		/**Retrieves a SequenceSet of items from the first occurrence of fromItem(inclusive) to the first occurrence
		 * of toItem(exclusive) if fromItem is equal to toItem, returns an empty SequenceSet
		 * @param fromItem, the start item (inclusive)
		 * @param toItem, the end item (exclusive)
		 * @return A SequenceSet of the items from fromItem to toItem
		 * @throws ElementError if fromItem or toItem are not present in this collection
		 * @throws RangeError if toItem appears before fromItem in this collection*/
		function takeSet(fromElement:Collectable, toElement:Collectable):SequenceSet;
		
		/**Removes a SequenceSet of items from the first occurrence of fromItem(inclusive) to the first occurrence
		 * of toItem(exclusive) and returns it, if fromItem is equal to toItem, returns an empty SequenceSet
		 * with no change to this collection
		 * @param fromItem, the start item (inclusive)
		 * @param toItem, the end item (exclusive)
		 * @return A SequenceSet of the items from fromItem to toItem
		 * @throws ElementError if fromItem or toItem are not present in this collection
		 * @throws RangeError if toItem appears before fromItem in this collection*/
		function dropSet(fromElement:Collectable, toElement:Collectable):SequenceSet;
		
		/**Retrieves a SequenceSet of items from the first item in this collection (head item) to the first occurrence
		 * of toItem(exclusive) if the head item is equal to toItem, returns an empty SequenceSet
		 * @param toItem, the end item (exclusive)
		 * @return A SequenceSet of the items from the head item to toItem
		 * @throws ElementError if toItem is not present*/
		function takeHeadSet(toElement:Collectable):SequenceSet;
		
		/**Removes a SequenceSet of items from the first item in this collection (head item) to the first occurrence
		 * of toItem(exclusive) and returns it, if the head item is equal to toItem, returns an empty SequenceSet with
		 * no change to this collection
		 * @param toItem, the end item (exclusive)
		 * @return A SequenceSet of the items from the head item to toItem
		 * @throws ElementError if toItem is not present*/
		function dropHeadSet(toElement:Collectable):SequenceSet;
		
		/**Retrieves a SequenceSet of items from the first occurrence of fromItem (inclusive) in this collection to the end
		 * of this SequenceSet, if fromItem is equal to the last element of the sequence returns only the last item in
		 * a SequenceSet
		 * @param fromItem, the start item (inclusive)
		 * @return A SequenceSet of the items from fromItem to the end of this SequenceSet
		 * @throws ElementError if fromItem is not present*/
		function takeTailSet(fromElement:Collectable):SequenceSet;
		
		/**Removes a SequenceSet of items from the first occurrence of fromItem (inclusive) in this collection to the end
		 * of this sequence and returns it, if fromItem is equal to the last element of the SequenceSet returns only the 
		 * last item in a sequence and removes it
		 * @param fromItem, the start item (inclusive)
		 * @return A SequenceSet of the items from fromItem to the end of this SequenceSet
		 * @throws ElementError if fromItem is not present*/
		function dropTailSet(fromElement:Collectable):SequenceSet;
	}
}