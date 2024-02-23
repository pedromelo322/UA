//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Topological Sorting
//

#ifndef _GRAPH_TOPOLOGICAL_SORTING_
#define _GRAPH_TOPOLOGICAL_SORTING_

#include "Graph.h"
#include "IntegersQueue.h"

typedef struct _GraphTopoSort GraphTopoSort;

GraphTopoSort* GraphTopoSortComputeV1(Graph* g);

GraphTopoSort* GraphTopoSortComputeV2(Graph* g);

GraphTopoSort* GraphTopoSortComputeV3(Graph* g);

void GraphTopoSortDestroy(GraphTopoSort** p);

// Getting the result

int GraphTopoSortIsValid(const GraphTopoSort* p);

unsigned int* GraphTopoSortGetSequence(const GraphTopoSort* p);

// DISPLAYING on the console

void GraphTopoSortDisplaySequence(const GraphTopoSort* p);

void GraphTopoSortDisplay(const GraphTopoSort* p);

#endif  //_GRAPH_TOPOLOGICAL_SORTING_
