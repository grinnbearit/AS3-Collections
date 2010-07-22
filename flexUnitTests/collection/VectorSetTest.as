package flexUnitTests.collection
{
	import com.deviantcritters.util.collection.Set;
	import com.deviantcritters.util.collection.concrete.VectorSet;
	
	import flexunit.framework.Assert;
	
	public class VectorSetTest
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
			var set:Set = new VectorSet();
			Assert.assertTrue(set.add(new CollectableNumber(0)));
			Assert.assertTrue(set.add(new CollectableNumber(1)));
			Assert.assertFalse(set.add(new CollectableNumber(0)));
			Assert.assertEquals(set.size, 2);
		}
		
		[Test]
		public function testAddAll():void
		{
			var set:Set = new VectorSet();
			set.add(new CollectableNumber(0));
			set.add(new CollectableNumber(1));
			Assert.assertFalse(set.addAll(set));
			var set2:Set = new VectorSet();
			set2.add(new CollectableNumber(2));
			Assert.assertTrue(set.addAll(set2));
			Assert.assertEquals(set.size, 3);
		}
		
		[Test]
		public function testVectorSet():void
		{
			var set:Set = new VectorSet();
			Assert.assertNotNull(set);
		}
	}
}