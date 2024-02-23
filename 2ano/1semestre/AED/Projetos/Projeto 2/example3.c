//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, Joao Manuel Rodrigues - June 2021, Dec 2023
//
// TOPOLOGICAL SORTING
//
// ./example3 GRAPH_FILE ...
//     Will load each GRAPH_FILE and run the 3 sort algorithms on it
//

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Graph.h"
#include "GraphTopologicalSorting.h"
#include "instrumentation.h"

typedef GraphTopoSort* (*TopoSortFcn)(Graph*);

// Number of different versions of topological sort algorithm
#define VERSIONS 3

// Pointers to Topological Sort Functions
TopoSortFcn topoSortFcns[VERSIONS] = {
  GraphTopoSortComputeV1,
  GraphTopoSortComputeV2,
  GraphTopoSortComputeV3
};

// Names of Topological Sort Functions
char *topoSortNames[VERSIONS] = {
  "TopoSortV1",
  "TopoSortV2",
  "TopoSortV3"
};


// Load graph from file and apply all sort algorithms in turn
void doSortsGraphFile(char *fname) {

  // Load DIGRAPH from file
  FILE *f = fopen(fname, "r");
  if (f == NULL) {
    perror("fopen");
    exit(2);
  }

  Graph* originalG = GraphFromFile(f);
  
  fclose(f);
  
  assert(GraphIsDigraph(originalG));

  // Uncomment for debugging
  // GraphDisplay(originalG);

  // TOPOLOGICAL SORTING

  for (int v = 0; v < VERSIONS; v++) {
    TopoSortFcn sortFcn = topoSortFcns[v];
    char* sortName = topoSortNames[v];

    // Make a copy of the original graph
    Graph *g = GraphCopy(originalG);
  
    printf("FILE: %s\n", fname);
    printf("SORT: %s\n", sortName);
    
    InstrReset();
    GraphTopoSort* result = sortFcn(g);
    InstrPrint();

    printf("RESULT: ");
    GraphTopoSortDisplaySequence(result);
    printf("--------\n");

    GraphTopoSortDestroy(&result);
    GraphDestroy(&g);
  }
  
  // House-keeping
  GraphDestroy(&originalG);
}


int main(int argc, char *argv[]) {

  if (argc < 2) {
    fprintf(stderr, "Usage: %s GRAPH_FILE ...\n", argv[0]);
    exit(1);
  }


  
  
  InstrName[0] = "memops";
  InstrName[1] = "adds";
  InstrName[2] = "iterações";
  InstrCalibrate();

  for (int i = 1; i < argc; i++) {
    char *fname = argv[i];
    doSortsGraphFile(fname);
  }

  return 0;
}
