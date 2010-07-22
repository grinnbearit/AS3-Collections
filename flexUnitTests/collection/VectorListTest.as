package flexUnitTests.collection
{
	import com.deviantcritters.util.collection.List;
	import com.deviantcritters.util.collection.concrete.VectorCollection;
	import com.deviantcritters.util.collection.concrete.VectorList;
	
	import flexunit.framework.Assert;
	
	public class VectorListTest
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
		public function testInsert():void
		{
			var l:List = new VectorList();
			l.insert(0, new CollectableNumber(0));
			l.insert(0, new CollectableNumber(1));
			l.insert(0, new CollectableNumber(2));
			l.insert(3, new CollectableNumber(3));
			Assert.assertEquals((l.takeItemAt(0) as CollectableNumber).value, 2);
			Assert.assertEquals((l.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals((l.takeItemAt(2) as CollectableNumber).value, 0);
			Assert.assertEquals((l.takeItemAt(3) as CollectableNumber).value, 3);
		}
		
		[Test]
		public function testInsertAll():void
		{
			var l:List = new VectorList();
			l.add(new CollectableNumber(0));
			l.add(new CollectableNumber(1));
			l.add(new CollectableNumber(2));
			l.insertAll(0, l);
			Assert.assertEquals((l.takeItemAt(0) as CollectableNumber).value, 0);
			Assert.assertEquals((l.takeItemAt(1) as CollectableNumber).value, 1);
			Assert.assertEquals((l.takeItemAt(2) as CollectableNumber).value, 2);
			Assert.assertEquals(l.size, 6);
				
		}
		
		[Test]
		public function testUpdate():void
		{
			var l:List = new VectorList();
			l.add(new CollectableNumber(0));
			l.add(new CollectableNumber(1));
			l.add(new CollectableNumber(2));
			Assert.assertEquals((l.update(1, new CollectableNumber(3)) as CollectableNumber).value, 1);
			Assert.assertEquals((l.takeItemAt(1) as CollectableNumber).value, 3);
		}
		
		[Test]
		public function testVectorList():void
		{
			var list:List = new VectorList();
			Assert.assertNotNull(list);
		}
	}
}