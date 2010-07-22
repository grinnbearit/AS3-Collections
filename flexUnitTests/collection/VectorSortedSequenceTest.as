package flexUnitTests.collection
{
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.Sequence;
	import com.deviantcritters.util.collection.concrete.VectorCollection;
	import com.deviantcritters.util.collection.concrete.VectorSortedSequence;
	
	import flexunit.framework.Assert;
	
	public class VectorSortedSequenceTest
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
			var seq:Sequence = new VectorSortedSequence(function(a:CollectableNumber, b:CollectableNumber):int 
																	{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(2));
			seq.add(new CollectableNumber(4));
			seq.add(new CollectableNumber(3));
			Assert.assertEquals((seq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals((seq.takeItemAt(2) as CollectableNumber).value, 2);
			Assert.assertEquals((seq.takeItemAt(3) as CollectableNumber).value, 3);
			Assert.assertEquals((seq.takeItemAt(4) as CollectableNumber).value, 4);
		}
		
		[Test]
		public function testAddAll():void
		{
			var seq:Sequence = new VectorSortedSequence(function(a:CollectableNumber, b:CollectableNumber):int 
											{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(2));
			c.add(new CollectableNumber(4));
			c.add(new CollectableNumber(3));
			seq.addAll(c);
			Assert.assertEquals((seq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals((seq.takeItemAt(2) as CollectableNumber).value, 2);
			Assert.assertEquals((seq.takeItemAt(3) as CollectableNumber).value, 3);
			Assert.assertEquals((seq.takeItemAt(4) as CollectableNumber).value, 4);
		}
		
		[Test]
		public function testVectorSortedSequence():void
		{
			var seq:Sequence = new VectorSortedSequence(function(a:CollectableNumber, b:CollectableNumber):int 
																		{return a.value < b.value ? -1 : (a.value == b.value ? 0 : 1)});
			Assert.assertNotNull(seq);
		}
	}
}