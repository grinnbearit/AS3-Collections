package flexUnitTests.collection
{
	import com.deviantcritters.util.collection.Sequence;
	import com.deviantcritters.util.collection.concrete.VectorSequence;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
	
	public class VectorSequenceTest
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
		public function testDropFirst():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			Assert.assertEquals((seq.dropFirst() as CollectableNumber).value, 0);
			Assert.assertEquals(seq.size, 2);
		}
		
		[Test]
		public function testDropHeadSequence():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			var subSeq:Sequence = seq.dropHeadSequence(new CollectableNumber(2));
			Assert.assertEquals((subSeq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((subSeq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(subSeq.size, 2);
			Assert.assertEquals((seq.takeItemAt(0) as CollectableNumber).value, 2);
			Assert.assertEquals(seq.size, 1);
		}
		
		[Test]
		public function testDropIndex():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			Assert.assertEquals((seq.dropItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seq.dropItemAt(0) as CollectableNumber).value, 1);
			Assert.assertEquals((seq.dropItemAt(0) as CollectableNumber).value, 2);
		}
		
		[Test]
		public function testDropLast():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			Assert.assertEquals((seq.dropLast() as CollectableNumber).value, 2);
			Assert.assertEquals(seq.size, 2);
		}
		
		[Test]
		public function testDropRange():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			var subSeq:Sequence = seq.dropRange(0, 2);
			Assert.assertEquals((subSeq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((subSeq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(subSeq.size, 2);
			Assert.assertEquals((seq.takeItemAt(0) as CollectableNumber).value, 2);
			Assert.assertEquals(seq.size, 1);
		}
		
		[Test]
		public function testDropSequence():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			var subSeq:Sequence = seq.dropSequence(new CollectableNumber(0), new CollectableNumber(2));
			Assert.assertEquals((subSeq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((subSeq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(subSeq.size, 2);
			Assert.assertEquals((seq.takeItemAt(0) as CollectableNumber).value, 2);
			Assert.assertEquals(seq.size, 1);
		}
		
		[Test]
		public function testDropTailSequence():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			var subSeq:Sequence = seq.dropTailSequence(new CollectableNumber(2));
			Assert.assertEquals((subSeq.takeItemAt(0) as CollectableNumber).value, 2);
			Assert.assertEquals(subSeq.size, 1);
			Assert.assertEquals((seq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(seq.size, 2);
		}
		
		[Test]
		public function testIndexOf():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(1));
			Assert.assertEquals(seq.indexOf(new CollectableNumber(0)), 0)
			Assert.assertEquals(seq.indexOf(new CollectableNumber(1)), 1)
		}
		
		[Test]
		public function testLastIndexOf():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(1));
			Assert.assertEquals(seq.lastIndexOf(new CollectableNumber(0)), 0)
			Assert.assertEquals(seq.lastIndexOf(new CollectableNumber(1)), 2)
		}
		
		[Test]
		public function testTakeFirst():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			Assert.assertEquals((seq.takeFirst() as CollectableNumber).value, 0);
		}
		
		[Test]
		public function testTakeHeadSequence():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			var subSeq:Sequence = seq.takeHeadSequence(new CollectableNumber(2));
			Assert.assertEquals((subSeq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((subSeq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(subSeq.size, 2);
		}
		
		[Test]
		public function testTakeIndex():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			Assert.assertEquals((seq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((seq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals((seq.takeItemAt(2) as CollectableNumber).value, 2);
		}
		
		[Test]
		public function testTakeLast():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			Assert.assertEquals((seq.takeLast() as CollectableNumber).value, 2);
		}
		
		[Test]
		public function testTakeRange():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			var subSeq:Sequence = seq.takeRange(0, 2);
			Assert.assertEquals((subSeq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((subSeq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(subSeq.size, 2);
		}
		
		[Test]
		public function testTakeSequence():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			var subSeq:Sequence = seq.takeSequence(new CollectableNumber(0), new CollectableNumber(2));
			Assert.assertEquals((subSeq.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((subSeq.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals(subSeq.size, 2);
		}
		
		[Test]
		public function testTakeTailSequence():void
		{
			var seq:Sequence = new VectorSequence();
			seq.add(new CollectableNumber(0));
			seq.add(new CollectableNumber(1));
			seq.add(new CollectableNumber(2));
			var subSeq:Sequence = seq.takeTailSequence(new CollectableNumber(1));
			Assert.assertEquals((subSeq.takeItemAt(0) as CollectableNumber).value, 1);
			Assert.assertEquals((subSeq.takeItemAt(1) as CollectableNumber).value, 2);
			Assert.assertEquals(subSeq.size, 2);
		}
		
		[Test]
		public function testVectorSequence():void
		{
			var seq:Sequence = new VectorSequence();
			Assert.assertNotNull(seq);
		}
	}
}