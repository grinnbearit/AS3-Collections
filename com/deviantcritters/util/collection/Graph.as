package com.deviantcritters.util.collection
{
	import com.deviantcritters.util.Collectable;

	/**An interface for collections whose members share relationships with each other*/
	public interface Graph extends Collection
	{
		/**Sets or updates an edge between 2 nodes, in case of directed graph updateEdge(a, b) and
		 * updateEdge(b, a) will have a different effects
		 * @param nodeA, the first node
		 * @param nodeB, the second node
		 * @param edge, the relationship to be updated or added
		 * @return The old relationship between the nodes
		 * @throws ElementError if either nodeA or nodeB is not in this graph*/
		function updateEdge(nodeA:Collectable, nodeB:Collectable, edge:Collectable):Collectable;
		
		/**Removes the edge between 2 nodes, in case of directed graph removeEdge(a, b) and
		 * removeEdge(b, a) will have a different effects
		 * @param nodeA, the first node
		 * @param nodeB, the second node
		 * @param edge, the relationship to be removed
		 * @return The old relationship between the nodes
		 * @throws ElementError if either nodeA or nodeB is not in this graph or if no edge exists between
		 * nodeA and nodeB*/
		function removeEdge(nodeA:Collectable, nodeB:Collectable):Collectable;
		
		/**Retrieves the edge between 2 nodes, in case of directed graph retrieveEdge(a, b) and
		 * retrieveEdge(b, a) will have a different effects
		 * @param nodeA, the first node
		 * @param nodeB, the second node
		 * @param edge, the relationship to be retrieved
		 * @return The old relationship between the nodes
		 * @throws ElementError if either nodeA or nodeB is not in this graph or if no edge exists between
		 * nodeA and nodeB*/
		function retrieveEdge(nodeA:Collectable, nodeB:Collectable):Collectable;
		
		/**Returns all the nodes in a collection which share a relationship with the passed node
		 * @param node, the node whose neighbours are to be retrieved
		 * @return A collection of the neighbours of the passed node
		 * @throws ElementError if the passed node is not present in this graph*/
		function neighbours(node:Collectable):Collection;
		
		/**Checks whether nodeA and nodeB have a relationship between them
		 * @param nodeA, the first node
		 * @param nodeB, the second node
		 * @return True if there exists a relationship between the nodes
		 * @throws ElementError if either nodeA or nodeB is not in this graph*/
		function isAdjacent(nodeA:Collectable, nodeB:Collectable):Boolean;
	}
}