//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, Joao Manuel Rodrigues - June 2021, Nov 2023
//
// Graph - Using a list of adjacency lists representation
//

#include "Graph.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "SortedList.h"
#include "instrumentation.h"

struct _Vertex {
  unsigned int id;
  unsigned int inDegree;
  unsigned int outDegree;
  List* edgesList;
};

struct _Edge {
  unsigned int adjVertex;
  double weight;
};

struct _GraphHeader {
  int isDigraph;
  int isComplete;
  int isWeighted;
  unsigned int numVertices;
  unsigned int numEdges;
  List* verticesList;
};

// The comparator for the VERTICES LIST

int graphVerticesComparator(const void* p1, const void* p2) {
  unsigned int v1 = ((struct _Vertex*)p1)->id;
  unsigned int v2 = ((struct _Vertex*)p2)->id;
  int d = v1 - v2;
  return (d > 0) - (d < 0);
}

// The comparator for the EDGES LISTS

int graphEdgesComparator(const void* p1, const void* p2) {
  unsigned int v1 = ((struct _Edge*)p1)->adjVertex;
  unsigned int v2 = ((struct _Edge*)p2)->adjVertex;
  int d = v1 - v2;
  return (d > 0) - (d < 0);
}

Graph* GraphCreate(unsigned int numVertices, int isDigraph, int isWeighted) {
  Graph* g = (Graph*)malloc(sizeof(struct _GraphHeader));
  if (g == NULL) abort();

  g->isDigraph = isDigraph;
  g->isComplete = 0;
  g->isWeighted = isWeighted;

  g->numVertices = numVertices;
  g->numEdges = 0;

  g->verticesList = ListCreate(graphVerticesComparator);

  for (unsigned int i = 0; i < numVertices; i++) {
    struct _Vertex* v = (struct _Vertex*)malloc(sizeof(struct _Vertex));
    if (v == NULL) abort();

    v->id = i;
    v->inDegree = 0;
    v->outDegree = 0;

    v->edgesList = ListCreate(graphEdgesComparator);

    ListInsert(g->verticesList, v);
  }

  assert(g->numVertices == ListGetSize(g->verticesList));

  return g;
}

Graph* GraphCreateComplete(unsigned int numVertices, int isDigraph) {
  Graph* g = GraphCreate(numVertices, isDigraph, 0);

  g->isComplete = 1;

  List* vertices = g->verticesList;
  ListMoveToHead(vertices);
  unsigned int i = 0;
  for (; i < g->numVertices; ListMoveToNext(vertices), i++) {
    struct _Vertex* v = ListGetCurrentItem(vertices);
    List* edges = v->edgesList;
    for (unsigned int j = 0; j < g->numVertices; j++) {
      if (i == j) {
        continue;
      }
      struct _Edge* new = (struct _Edge*)malloc(sizeof(struct _Edge));
      if (new == NULL) abort();
      new->adjVertex = j;
      new->weight = 1;

      ListInsert(edges, new);
    }
    if (g->isDigraph) {
      v->inDegree = g->numVertices - 1;
      v->outDegree = g->numVertices - 1;
    } else {
      v->outDegree = g->numVertices - 1;
    }
  }
  if (g->isDigraph) {
    g->numEdges = numVertices * (numVertices - 1);
  } else {
    g->numEdges = numVertices * (numVertices - 1) / 2;
  }

  return g;
}

void GraphDestroy(Graph** p) {
  assert(*p != NULL);
  Graph* g = *p;

  List* vertices = g->verticesList;
  if (ListIsEmpty(vertices) == 0) {
    ListMoveToHead(vertices);
    unsigned int i = 0;
    for (; i < g->numVertices; ListMoveToNext(vertices), i++) {
      struct _Vertex* v = ListGetCurrentItem(vertices);

      List* edges = v->edgesList;
      if (ListIsEmpty(edges) == 0) {
        unsigned int i = 0;
        ListMoveToHead(edges);
        for (; i < ListGetSize(edges); ListMoveToNext(edges), i++) {
          struct _Edge* e = ListGetCurrentItem(edges);
          free(e);
        }
      }
      ListDestroy(&(v->edgesList));
      free(v);
    }
  }

  ListDestroy(&(g->verticesList));
  free(g);

  *p = NULL;
}

Graph* GraphCopy(const Graph* g) {
    assert(g != NULL);

    // Obter o número de vértices, se é um digrafo e se é ponderado
    unsigned int numVertices = GraphGetNumVertices(g);
    int isDigraph = GraphIsDigraph(g);
    int isWeighted = GraphIsWeighted(g);

    // Criar uma cópia do gráfico com as mesmas características
    Graph* copy = GraphCreate(numVertices, isDigraph, isWeighted);

    // Para cada vértice do gráfico
    for (unsigned int v = 0; v < numVertices; v++) {
        // Obter os vértices adjacentes e os pesos das arestas, se for ponderado
        unsigned int* adjacents = GraphGetAdjacentsTo(g, v);
        double* weights = isWeighted ? GraphGetDistancesToAdjacents(g, v) : NULL;

        // Para cada vértice adjacente
        unsigned int numAdjacents = adjacents[0];
        for (unsigned int i = 0; i < numAdjacents; i++) {
            // Obter o vértice adjacente e o peso da aresta, se for ponderado
            unsigned int w = adjacents[i+1];
            if (isWeighted) {
                double weight = weights[i];
                // Adicionar a aresta ponderada à cópia do gráfico
                GraphAddWeightedEdge(copy, v, w, weight);
            } else {
                // Adicionar a aresta à cópia do gráfico
                GraphAddEdge(copy, v, w);
            }
        }

        // Libertar a memória dos arrays de vértices adjacentes e pesos
        free(adjacents);
        if (weights) free(weights);
    }
    // Retornar a cópia do gráfico
    return copy;
}





Graph* GraphFromFile(FILE* f) {
  assert(f != NULL);

  // TO BE COMPLETED !!

  unsigned int isDigraph, isWeighted, numVertices, numEdges;

  // Ler as propriedades do grafo
  fscanf(f, "%u\n%u\n%u\n%u\n", &isDigraph, &isWeighted, &numVertices, &numEdges);

  // Criar um novo grafo
  Graph* g = GraphCreate(numVertices, isDigraph, isWeighted);
  if (g == NULL) abort(); // Se a criação do grafo falhar, abortar o programa

  // Ler as arestas
  for (unsigned int i = 0; i < numEdges; i++) {
    unsigned int v1, v2;
    double weight = 1.0;

    if (isWeighted) {
      // Ler dois vértices e um peso
      fscanf(f, "%u %u %lf\n", &v1, &v2, &weight);
      if (v1 != v2){
        // Adicionar uma aresta ponderada ao grafo
        GraphAddWeightedEdge(g, v1, v2, weight);
      }
      
    } else {
      // Ler dois vértices
      fscanf(f, "%u %u\n", &v1, &v2);
      if (v1 != v2){
        // Adicionar uma aresta ao grafo
        GraphAddEdge(g, v1, v2);
      }
    }

   
  }

  // Retornar o grafo
  return g;
}

// Graph

int GraphIsDigraph(const Graph* g) { return g->isDigraph; }

int GraphIsComplete(const Graph* g) { return g->isComplete; }

int GraphIsWeighted(const Graph* g) { return g->isWeighted; }

unsigned int GraphGetNumVertices(const Graph* g) { return g->numVertices; }

unsigned int GraphGetNumEdges(const Graph* g) { return g->numEdges; }

//
// For a graph
//
double GraphGetAverageDegree(const Graph* g) {
  assert(g->isDigraph == 0);
  return 2.0 * (double)g->numEdges / (double)g->numVertices;
}

static unsigned int _GetMaxDegree(const Graph* g) {
  List* vertices = g->verticesList;
  if (ListIsEmpty(vertices)) return 0;

  unsigned int maxDegree = 0;
  ListMoveToHead(vertices);
  unsigned int i = 0;
  for (; i < g->numVertices; ListMoveToNext(vertices), i++) {
    struct _Vertex* v = ListGetCurrentItem(vertices);
    if (v->outDegree > maxDegree) {
      maxDegree = v->outDegree;
    }
  }
  return maxDegree;
}

//
// For a graph
//
unsigned int GraphGetMaxDegree(const Graph* g) {
  assert(g->isDigraph == 0);
  return _GetMaxDegree(g);
}

//
// For a digraph
//
unsigned int GraphGetMaxOutDegree(const Graph* g) {
  assert(g->isDigraph == 1);
  return _GetMaxDegree(g);
}

// Vertices

//
// returns an array of size (outDegree + 1)
// element 0, stores the number of adjacent vertices
// and is followed by indices of the adjacent vertices
//
unsigned int* GraphGetAdjacentsTo(const Graph* g, unsigned int v) {
  assert(v < g->numVertices);

  // Node in the list of vertices
  List* vertices = g->verticesList;
  ListMove(vertices, v);
  struct _Vertex* vPointer = ListGetCurrentItem(vertices);
  unsigned int numAdjVertices = vPointer->outDegree;

  unsigned int* adjacent =
      (unsigned int*)calloc(1 + numAdjVertices, sizeof(unsigned int));

  if (numAdjVertices > 0) {
    adjacent[0] = numAdjVertices;
    List* adjList = vPointer->edgesList;
    ListMoveToHead(adjList);
    for (unsigned int i = 0; i < numAdjVertices; ListMoveToNext(adjList), i++) {
      struct _Edge* ePointer = ListGetCurrentItem(adjList);
      adjacent[i + 1] = ePointer->adjVertex;
    }
  }

  return adjacent;
}

//
// returns an array of size (outDegree + 1)
// element 0, stores the number of adjacent vertices
// and is followed by the distances to the adjacent vertices
//
double* GraphGetDistancesToAdjacents(const Graph* g, unsigned int v) {
  assert(v < g->numVertices);

  // Node in the list of vertices
  List* vertices = g->verticesList;
  ListMove(vertices, v);
  struct _Vertex* vPointer = ListGetCurrentItem(vertices);
  unsigned int numAdjVertices = vPointer->outDegree;

  double* distance = (double*)calloc(1 + numAdjVertices, sizeof(double));

  if (numAdjVertices > 0) {
    distance[0] = numAdjVertices;
    List* adjList = vPointer->edgesList;
    ListMoveToHead(adjList);
    for (unsigned int i = 0; i < numAdjVertices; ListMoveToNext(adjList), i++) {
      struct _Edge* ePointer = ListGetCurrentItem(adjList);
      distance[i + 1] = ePointer->weight;
    }
  }

  return distance;
}

//
// For a graph
//
unsigned int GraphGetVertexDegree(Graph* g, unsigned int v) {
  assert(g->isDigraph == 0);
  assert(v < g->numVertices);

  ListMove(g->verticesList, v);
  struct _Vertex* p = ListGetCurrentItem(g->verticesList);

  return p->outDegree;
}

//
// For a digraph
//
unsigned int GraphGetVertexOutDegree(Graph* g, unsigned int v) {
  assert(g->isDigraph == 1);
  assert(v < g->numVertices);

  ListMove(g->verticesList, v);
  struct _Vertex* p = ListGetCurrentItem(g->verticesList);

  return p->outDegree;
}

//
// For a digraph
//
unsigned int GraphGetVertexInDegree(Graph* g, unsigned int v) {
  assert(g->isDigraph == 1);
  assert(v < g->numVertices);

  ListMove(g->verticesList, v);
  struct _Vertex* p = ListGetCurrentItem(g->verticesList);

  return p->inDegree;
}

// Edges

static int _addEdge(Graph* g, unsigned int v, unsigned int w, double weight) {
  struct _Edge* edge = (struct _Edge*)malloc(sizeof(struct _Edge));
  edge->adjVertex = w;
  edge->weight = weight;

  ListMove(g->verticesList, v);
  struct _Vertex* vertex = ListGetCurrentItem(g->verticesList);
  int result = ListInsert(vertex->edgesList, edge);

  if (result == -1) {
    return 0;
  } else {
    g->numEdges++;
    vertex->outDegree++;

    ListMove(g->verticesList, w);
    struct _Vertex* destVertex = ListGetCurrentItem(g->verticesList);
    destVertex->inDegree++;
  }

  if (g->isDigraph == 0) {
    // Bidirectional edge
    struct _Edge* edge = (struct _Edge*)malloc(sizeof(struct _Edge));
    edge->adjVertex = v;
    edge->weight = weight;

    ListMove(g->verticesList, w);
    struct _Vertex* vertex = ListGetCurrentItem(g->verticesList);
    result = ListInsert(vertex->edgesList, edge);

    if (result == -1) {
      return 0;
    } else {
      // g->numEdges++; // Do not count the same edge twice on a undirected
      // graph !!
      vertex->outDegree++;
    }
  }

  return 1;
}

int GraphAddEdge(Graph* g, unsigned int v, unsigned int w) {
  assert(g->isWeighted == 0);
  assert(v != w);
  assert(v < g->numVertices);
  assert(w < g->numVertices);

  return _addEdge(g, v, w, 1.0);
}

int GraphAddWeightedEdge(Graph* g, unsigned int v, unsigned int w,
                         double weight) {
  assert(g->isWeighted == 1);
  assert(v != w);
  assert(v < g->numVertices);
  assert(w < g->numVertices);

  return _addEdge(g, v, w, weight);
}

int GraphRemoveEdge(Graph* g, unsigned int v, unsigned int w) {
  assert(g != NULL);

  // TO BE COMPLETED !!
  assert(v < g->numVertices);
  assert(w < g->numVertices);

  // Obter os vértices
  struct _Vertex* vertexV = NULL;
  struct _Vertex* vertexW = NULL;
  ListMoveToHead(g->verticesList); // Mover para o início da lista de vértices
  for (unsigned int i = 0; i < g->numVertices; ListMoveToNext(g->verticesList), i++) {
    struct _Vertex* vertex = ListGetCurrentItem(g->verticesList); // Obter o vértice atual
    if (i == v) vertexV = vertex; // Se o vértice atual é v, guardar o vértice
    if (i == w) vertexW = vertex; // Se o vértice atual é w, guardar o vértice
  }

  // Verificar se os vértices existem
  if (vertexV == NULL || vertexW == NULL) {
    return -1; // Vértice não encontrado
  }

  // Remover a aresta de v para w
  ListMoveToHead(vertexV->edgesList); // Mover para o início da lista de arestas de v
  while (ListGetCurrentItem(vertexV->edgesList) != NULL) {
    struct _Edge* edge = ListGetCurrentItem(vertexV->edgesList); // Obter a aresta atual
    if (edge->adjVertex == w) { // Se a aresta atual é para w
      ListRemoveCurrent(vertexV->edgesList); // Remover a aresta atual
      break;
    }
    ListMoveToNext(vertexV->edgesList); // Mover para a próxima aresta
  }
  vertexV->outDegree--; // Decrementar o grau de saída de v
  vertexW->inDegree--; // Decrementar o grau de entrada de w

  // Se o grafo não é um digrafo, remover a aresta de w para v também
  if (!g->isDigraph) {
    ListMoveToHead(vertexW->edgesList); // Mover para o início da lista de arestas de w
    while (ListGetCurrentItem(vertexW->edgesList) != NULL) {
      struct _Edge* edge = ListGetCurrentItem(vertexW->edgesList); // Obter a aresta atual
      if (edge->adjVertex == v) { // Se a aresta atual é para v
        ListRemoveCurrent(vertexW->edgesList); // Remover a aresta atual
        break;
      }
      ListMoveToNext(vertexW->edgesList); // Mover para a próxima aresta
    }
    vertexW->outDegree--; // Decrementar o grau de saída de w
    vertexV->inDegree--; // Decrementar o grau de entrada de v
  }

  return 0; // Sucesso
}
// CHECKING

int GraphCheckInvariants(const Graph* g) {
  assert(g != NULL);

  // TO BE COMPLETED !!

  // Verificar se o número de arestas é consistente com os graus dos vértices
  List* vertices = g->verticesList;
  ListMoveToHead(vertices); // Mover para o início da lista de vértices
  unsigned int i = 0;
  for (; i < g->numVertices; ListMoveToNext(vertices), i++) { // Para cada vértice
    struct _Vertex* vertex = ListGetCurrentItem(vertices); // Obter o vértice atual
    int outDegree = vertex->outDegree; // Obter o grau de saída do vértice
    int inDegree = vertex->inDegree; // Obter o grau de entrada do vértice

    if (g->isDigraph) { // Se o grafo é um digrafo
      if (outDegree != (int)ListGetSize(vertex->edgesList)) { // Se o grau de saída não é igual ao tamanho da lista de arestas
        return 0; // Invariante violado
      }
    } else { // Se o grafo não é um digrafo
      if (outDegree + inDegree != (int)ListGetSize(vertex->edgesList) * 2) { // Se a soma dos graus de saída e entrada não é igual ao dobro do tamanho da lista de arestas
        return 0; // Invariante violado
      }
    }
  }

  return 1; // Todas as invariantes verificadas
}

// DISPLAYING on the console

void GraphDisplay(const Graph* g) {
  printf("---\n");
  if (g->isWeighted) {
    printf("Weighted ");
  }
  if (g->isComplete) {
    printf("COMPLETE ");
  }
  if (g->isDigraph) {
    printf("Digraph\n");
    printf("Max Out-Degree = %d\n", GraphGetMaxOutDegree(g));
  } else {
    printf("Graph\n");
    printf("Max Degree = %d\n", GraphGetMaxDegree(g));
  }
  printf("Vertices = %2d | Edges = %2d\n", g->numVertices, g->numEdges);

  List* vertices = g->verticesList;
  ListMoveToHead(vertices);
  unsigned int i = 0;
  for (; i < g->numVertices; ListMoveToNext(vertices), i++) {
    printf("%2d ->", i);
    struct _Vertex* v = ListGetCurrentItem(vertices);
    if (ListIsEmpty(v->edgesList)) {
      printf("\n");
    } else {
      List* edges = v->edgesList;
      unsigned int i = 0;
      ListMoveToHead(edges);
      for (; i < ListGetSize(edges); ListMoveToNext(edges), i++) {
        struct _Edge* e = ListGetCurrentItem(edges);
        if (g->isWeighted) {
          printf("   %2d(%4.2f)", e->adjVertex, e->weight);
        } else {
          printf("   %2d", e->adjVertex);
        }
      }
      printf("\n");
    }
  }
  printf("---\n");
}

void GraphListAdjacents(const Graph* g, unsigned int v) {
  printf("---\n");

  unsigned int* array = GraphGetAdjacentsTo(g, v);

  printf("Vertex %d has %d adjacent vertices -> ", v, array[0]);

  for (unsigned int i = 1; i <= array[0]; i++) {
    printf("%d ", array[i]);
  }

  printf("\n");

  free(array);

  printf("---\n");
}
