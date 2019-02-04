# *ssbu-gourmet-race-search*

**ssbu-gourmet-race-search** uses the
[Bellman-Ford algorithm](https://en.wikipedia.org/wiki/Bellman%E2%80%93Ford_algorithm)
to calculate the optimal path in the Super Smash Bros. Ultimate Gourmet Race
mini-game.

## How it Works

Here is the Gourmet Race map:

![Gourmet Race Map HD](https://i.imgur.com/EStRsUq.jpg)

Here is the same map with the food visible.
I couldn't find a higher resolution image and didn't want to build
one myself by stitching together screenshots.

![Gourmet Race Map](https://i.imgur.com/dQ0Y7so.jpg)

### Interactive Bellman-Ford Algorithm (Slow)

To view the algorithm running interactively, you can go to this
[Bellman-Ford graph algorithms website](https://www-m9.ma.tum.de/graph-algorithms/spp-bellman-ford/index_en.html)
by the Mathematics Technical University of Munich. To use the interactive
website, follow these steps:
1. Click "Test the algorithm!".
2. Upload the
   [gourmet_race.txt](https://github.com/dosentmatter/ssbu-gourmet-race-search/blob/master/gourmet_race.txt)
   file. You should see the following graph:

![Gourmet Race Graph Initial](https://i.imgur.com/FkpOLaB.png)

The edge weights correspond with the 1 point given per food, but they are
negated because the Bellman-Ford algorithm finds the minimum cost path. You can
determine the edge weights by comparing with the graph above.

Vertices are only placed in locations of the map that you have a choice. For
example, between vertices `n9` to `p`, the edge weight was given a cost of `-3`
even though there are intersections because the game does not stop and give you
a choice of direction. There is only a single choice of direction because you
can't walk backwards.

Here is the map labeled with the vertex names:

![Gourmet Race Map HD Labeled](https://i.imgur.com/ilAcjtn.png)

There are these perpendicular letter "H"-shaped paths that connect parallel
roads. Like so:

![Gourmet Race Map H Path](https://i.imgur.com/BAy4qe1.png)

They look like this in graph form:

![Gourmet Race Graph H Path](https://i.imgur.com/oeS739x.png)

The reason the `cdef` subgraph is made of 4 vertices while the `hj` subgraph is
only made of 2 vertices is because of negative cycles. The Bellman-Ford
algorithm can deal with negative edges but not negative cycles. If the `cdef`
graph was like this instead, the Bellman-Ford algorithm wouldn't work because
you could walk back and forth and get a negative infinity cost (infinity score).

![Gourmet Race Graph Negative Cycle](https://i.imgur.com/Ol9k4kG.png)

So instead, the `cdef` subgraph is used so that you can only travel one of the
`-1` edges at most once. You can skip it by travelling the `0` edges. `de`
and `cf` vertex pairs are basically the same location on the map but when
travelling `d->e` or `c->f`, you are committing to skipping the H-path.

The `hj` subgraph has a cycle, but it is fine because it is not a negative
cycle. There is no need to convert it to the `cdef` formation. If we did convert
it, it would still work, but the algorithm would run slower because more
vertices means more iterations for Bellman-Ford.

3. Note where vertex `a` is on the graph. `a` is the start and `p` is the end.
4. Click "Ready - Run the Algorithm!".
5. Choose vertex `a` as the start.
6. You can now click "next" to go step by step or "fast forward" to go faster.
   Note that it takes a while to run because it renders the steps for you to
   view.
7. After it finishes, you should see the following solution:

![Gourmet Race Graph Finish](https://i.imgur.com/UOTUr1x.png)

Notice how the optimal score is `-11` for the finish vertex `p`. You can follow
the green edges backwards from vertex `p` until you get to vertex `a` to see the
optimal path.

### Wolfram Mathematica

The algorithm can run non-interactively and much faster on Mathematica.

The
[gourmet_race.wl](https://github.com/dosentmatter/ssbu-gourmet-race-search/blob/master/gourmet_race.wl)
file has the wolfram language code.

You can see the
[wolfram notebook](https://www.wolframcloud.com/objects/806cfde8-befe-462f-ba1a-cd20ba181d5a).
If you have a wolfram account, you could "Make Your Own Copy" to play around
with the code interactively.
If you do not have an account, you can do the following:

1. Go to the
   [wolfram cloud website](https://develop.open.wolframcloud.com/app/).
2. Click "Create a New Notebook".
3. Paste the contents of
   [gourmet_race.wl](https://github.com/dosentmatter/ssbu-gourmet-race-search/blob/master/gourmet_race.wl)
   into the notebook.
4. Press SHIFT+ENTER to run the code.

You should see this initial graph:

![Gourmet Race Graph Wolfram Initial](https://i.imgur.com/JpAZllx.png)

and this solution graph:

![Gourmet Race Graph Wolfram Finish](https://i.imgur.com/6tzTlPT.png)

The vertices are labeled `0-34` instead of `a-z` then `n1-n9`. But the number
order matches the letter order. The labeled map above was labeled with both
letters and numbers, so you can use it to match with the graph.

The optimal path given by Wolfram is
`{0, 1, 3, 5, 8, 16, 19, 26, 28, 21, 22, 20, 12, 13, 15}` with a cost of `-11`.

## Images

The png, jpg, svg, and gimp xcf images are stored on [google drive](https://drive.google.com/open?id=1rWvaRZwWr-SfoBtpvWPjzags6e2rgn3G).
