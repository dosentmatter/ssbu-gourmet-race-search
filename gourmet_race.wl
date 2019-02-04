g = Graph[{
  Property[0 -> 1, EdgeWeight -> 0],
  Property[1 -> 2, EdgeWeight -> 0],
  Property[1 -> 3, EdgeWeight -> -1],
  Property[3 -> 4, EdgeWeight -> 0],
  Property[2 -> 5, EdgeWeight -> 0],
  Property[3 -> 5, EdgeWeight -> -1],
  Property[2 -> 4, EdgeWeight -> -1],
  Property[0 -> 6, EdgeWeight -> 0],
  Property[4 -> 7, EdgeWeight -> -2],
  Property[5 -> 8, EdgeWeight -> -1],
  Property[9 -> 7, EdgeWeight -> 0],
  Property[7 -> 9, EdgeWeight -> 0],
  Property[9 -> 10, EdgeWeight -> 0],
  Property[7 -> 11, EdgeWeight -> -1],
  Property[11 -> 13, EdgeWeight -> 0],
  Property[12 -> 14, EdgeWeight -> 0],
  Property[11 -> 14, EdgeWeight -> -1],
  Property[12 -> 13, EdgeWeight -> -1],
  Property[13 -> 15, EdgeWeight -> -2],
  Property[14 -> 15, EdgeWeight -> -1],
  Property[8 -> 16, EdgeWeight -> -1],
  Property[8 -> 17, EdgeWeight -> 0],
  Property[17 -> 9, EdgeWeight -> 0],
  Property[18 -> 17, EdgeWeight -> -1],
  Property[18 -> 16, EdgeWeight -> 0],
  Property[16 -> 19, EdgeWeight -> -1],
  Property[10 -> 20, EdgeWeight -> 0],
  Property[21 -> 22, EdgeWeight -> 0],
  Property[22 -> 23, EdgeWeight -> 0],
  Property[22 -> 20, EdgeWeight -> -1],
  Property[10 -> 23, EdgeWeight -> -1],
  Property[20 -> 12, EdgeWeight -> -1],
  Property[23 -> 24, EdgeWeight -> 0],
  Property[19 -> 25, EdgeWeight -> 0],
  Property[19 -> 26, EdgeWeight -> -1],
  Property[27 -> 25, EdgeWeight -> -1],
  Property[27 -> 26, EdgeWeight -> 0],
  Property[25 -> 21, EdgeWeight -> 0],
  Property[26 -> 28, EdgeWeight -> 0],
  Property[28 -> 21, EdgeWeight -> 0],
  Property[21 -> 28, EdgeWeight -> 0],
  Property[28 -> 29, EdgeWeight -> -1],
  Property[29 -> 24, EdgeWeight -> 0],
  Property[24 -> 29, EdgeWeight -> 0],
  Property[6 -> 30, EdgeWeight -> -1],
  Property[30 -> 31, EdgeWeight -> 0],
  Property[31 -> 30, EdgeWeight -> 0],
  Property[30 -> 18, EdgeWeight -> 0],
  Property[24 -> 15, EdgeWeight -> -1],
  Property[6 -> 32, EdgeWeight -> -1],
  Property[32 -> 31, EdgeWeight -> 0],
  Property[31 -> 33, EdgeWeight -> 0],
  Property[33 -> 27, EdgeWeight -> -1],
  Property[33 -> 34, EdgeWeight -> 0],
  Property[34 -> 33, EdgeWeight -> 0],
  Property[34 -> 15, EdgeWeight -> -3],
  Property[32 -> 34, EdgeWeight -> -2],
  Property[29 -> 15, EdgeWeight -> -2]
},
  VertexLabels -> Placed["Name", Center],
  VertexLabelStyle -> Red,
  EdgeLabels -> "EdgeWeight",
  EdgeLabelStyle -> Blue
]

shortestPath = FindShortestPath[g, 0, 15]

(*
 * Calculate Distance from existing shortestPath array by using GraphDistance
 * on each pair of the array and summing the distances.
 *)
Total[
  MapThread[
    Function[{x, y}, GraphDistance[g, x, y]],
    {
      shortestPath[[1 ;; -2]],
      shortestPath[[2 ;; ]]
    }
  ]
]

(*
 * Can also just re-run the algorithm to find the shortest distance instead of
 * the shortest path.
 *)
GraphDistance[g, 0, 15]

HighlightGraph[
  g,
  Style[PathGraph[shortestPath, DirectedEdges -> True], Yellow],
  GraphHighlightStyle -> Directive["VertexDiamond"]
]
