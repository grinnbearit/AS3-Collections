package flexUnitTests.collection
{
	import com.deviantcritters.util.collection.SequenceSet;
	import com.deviantcritters.util.collection.concrete.VectorSortedSequenceSet;
	
	import flexunit.framework.Assert;
	
	public class VectorSortedSequenceSetTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testAdd():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			Assert.assertTrue(seqSet.add(new CollectableNumber(0)));
			Assert.assertTrue(seqSet.add(new CollectableNumber(1)));
			Assert.assertTrue(seqSet.add(new CollectableNumber(2)));
			Assert.assertFalse(seqSet.add(new CollectableNumber(1)));
			Assert.assertEquals((seqSet.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seqSet.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals((seqSet.takeItemAt(2) as CollectableNumber).value, 2);
		}
		
		[Test]
		public function testAddAll():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seqSet.add(new CollectableNumber(0));
			seqSet.add(new CollectableNumber(1));
			Assert.assertFalse(seqSet.addAll(seqSet));
			var sortedSet2:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			sortedSet2.add(new CollectableNumber(2));
			Assert.assertTrue(seqSet.addAll(sortedSet2));
			Assert.assertEquals((seqSet.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seqSet.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals((seqSet.takeItemAt(2) as CollectableNumber).value, 2);
		}
		
		[Test]
		public function testDropHeadSet():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seqSet.add(new CollectableNumber(0));
			seqSet.add(new CollectableNumber(1));
			seqSet.add(new CollectableNumber(2));
			var sortedSet2:SequenceSet = seqSet.dropHeadSet(new CollectableNumber(2));
			Assert.assertEquals((sortedSet2.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((sortedSet2.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(sortedSet2.size, 2);
		}
		
		[Test]
		public function testDropRangeSet():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seqSet.add(new CollectableNumber(0));
			seqSet.add(new CollectableNumber(1));
			seqSet.add(new CollectableNumber(2));
			var sortedSet2:SequenceSet = seqSet.dropRangeSet(2, 3);
			Assert.assertEquals((seqSet.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seqSet.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(seqSet.size, 2);
			Assert.assertEquals((sortedSet2.takeItemAt(0) as CollectableNumber).value, 2);
			Assert.assertEquals(sortedSet2.size, 1);
		}
		
		[Test]
		public function testDropSet():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seqSet.add(new CollectableNumber(0));
			seqSet.add(new CollectableNumber(1));
			seqSet.add(new CollectableNumber(2));
			var sortedSet2:SequenceSet = seqSet.dropSet(new CollectableNumber(0), new CollectableNumber(2));
			Assert.assertEquals((sortedSet2.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((sortedSet2.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(sortedSet2.size, 2);
		}
		
		[Test]
		public function testDropTailSet():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seqSet.add(new CollectableNumber(0));
			seqSet.add(new CollectableNumber(1));
			seqSet.add(new CollectableNumber(2));
			var sortedSet2:SequenceSet = seqSet.dropTailSet(new CollectableNumber(2));
			Assert.assertEquals((seqSet.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seqSet.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(seqSet.size, 2);
			Assert.assertEquals((sortedSet2.takeItemAt(0) as CollectableNumber).value, 2);
			Assert.assertEquals(sortedSet2.size, 1);
		}
		
		[Test]
		public function testTakeHeadSet():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seqSet.add(new CollectableNumber(0));
			seqSet.add(new CollectableNumber(1));
			seqSet.add(new CollectableNumber(2));
			var sortedSet2:SequenceSet = seqSet.takeHeadSet(new CollectableNumber(2));
			Assert.assertEquals((sortedSet2.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((sortedSet2.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(sortedSet2.size, 2);
			Assert.assertEquals(seqSet.size, 3);	
		}
		
		[Test]
		public function testTakeRangeSet():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seqSet.add(new CollectableNumber(0));
			seqSet.add(new CollectableNumber(1));
			seqSet.add(new CollectableNumber(2));
			var sortedSet2:SequenceSet = seqSet.takeRangeSet(2, 3);
			Assert.assertEquals((seqSet.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seqSet.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(seqSet.size, 3);
			Assert.assertEquals((sortedSet2.takeItemAt(0) as CollectableNumber).value, 2);
			Assert.assertEquals(sortedSet2.size, 1);
		}
		
		[Test]
		public function testTakeSet():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seqSet.add(new CollectableNumber(0));
			seqSet.add(new CollectableNumber(1));
			seqSet.add(new CollectableNumber(2));
			var sortedSet2:SequenceSet = seqSet.dropSet(new CollectableNumber(0), new CollectableNumber(2));
			Assert.assertEquals((sortedSet2.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((sortedSet2.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(sortedSet2.size, 2);
		}
		
		[Test]
		public function testTakeTailSet():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seqSet.add(new CollectableNumber(0));
			seqSet.add(new CollectableNumber(1));
			seqSet.add(new CollectableNumber(2));
			var sortedSet2:SequenceSet = seqSet.takeTailSet(new CollectableNumber(2));
			Assert.assertEquals((seqSet.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seqSet.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(seqSet.size, 3);
			Assert.assertEquals((sortedSet2.takeItemAt(0) as CollectableNumber).value, 2);
			Assert.assertEquals(sortedSet2.size, 1);
		}
		
		[Test]
		public function testVectorSortedSet():void
		{
			var seqSet:SequenceSet = new VectorSortedSequenceSet(function(a:CollectableNumber, b:CollectableNumber):int 
			{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});;
			Assert.assertNotNull(seqSet);
		}
	}
}