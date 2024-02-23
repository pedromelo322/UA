//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Topological Sorting
//

#include "GraphTopologicalSorting.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Graph.h"
#include "IntegersQueue.h"
#include "instrumentation.h"

#define ACCESS InstrCount[0]
#define ADDS InstrCount[1]
#define ITER InstrCount[2]


struct _GraphTopoSort {
  int* marked;                     // Aux array
  unsigned int* numIncomingEdges;  // Aux array
  unsigned int* vertexSequence;    // The result
  int validResult;                 // 0 or 1
  unsigned int numVertices;        // From the graph
  Graph* graph;
};

// AUXILIARY FUNCTION
// Allocate memory for the struct
// And for its array fields
// Initialize all struct fields
//
static GraphTopoSort* _create(Graph* g) {
  assert(g != NULL);

  GraphTopoSort* p = NULL;

  // TO BE COMPLETED
  // ...

  p = (GraphTopoSort*) malloc(sizeof(GraphTopoSort));
  assert(p != NULL);

  p->numVertices = GraphGetNumVertices(g);
  p->graph = g;
  p->validResult = 0; // Initially, the result is not valid

  // Allocate and initialize the marked array
  p->marked = (int*) calloc(p->numVertices, sizeof(int));
  assert(p->marked != NULL);

  // Allocate and initialize the numIncomingEdges array
  p->numIncomingEdges = (unsigned int*) calloc(p->numVertices, sizeof(unsigned int));
  assert(p->numIncomingEdges != NULL);

  // Allocate and initialize the vertexSequence array
  p->vertexSequence = (unsigned int*) calloc(p->numVertices, sizeof(unsigned int));
  assert(p->vertexSequence != NULL);

  return p;
}



//
// Computing the topological sorting, if any, using the 1st algorithm:
// 1 - Create a copy of the graph
// 2 - Successively identify vertices without incoming edges and remove their
//     outgoing edges
// Check if a valid sorting was computed and set the isValid field
// For instance, by checking if the number of elements in the vertexSequence is
// the number of graph vertices
//
GraphTopoSort* GraphTopoSortComputeV1(Graph* g) {
  assert(g != NULL && GraphIsDigraph(g) == 1);
  
  // Create and initialize the struct

  GraphTopoSort* topoSort = _create(g);
  ACCESS++; // Acessando a memória para criar topoSort

  // Build the topological sorting

  // TO BE COMPLETED
  //...


  

  //Cria GCopy, uma cópia do grafo G
  Graph* gCopy = GraphCopy(g);
  assert(gCopy != NULL);
  ACCESS++; // Acessando a memória para criar gCopy

  unsigned int sequenceIndex = 0;
  unsigned int v;

  // Percorre todos os vértices do gráfico
  while (sequenceIndex < topoSort->numVertices) {
        
    ACCESS++; // Acessando a memória para obter numVertices

    // Registar num array auxiliar numIncomingEdges o InDegree de cada vértice
    for (v = 0; v < topoSort->numVertices; v++) {
      ITER++;
      topoSort->numIncomingEdges[v] = GraphGetVertexInDegree(gCopy, v);
      ACCESS++; // Acessando a memória para definir numIncomingEdges[v]
      ADDS ++; // Incremento do v
    }

    // Selecionar um vértice sem arestas incidentes
    for (v = 0; v < topoSort->numVertices; v++){
      ACCESS += 3; // Acessando a memória para obter numVertices , marked[v] e numIncomingEdges[v]
      ADDS ++; // Incremento do v
      ITER++;
      if (topoSort->numIncomingEdges[v] == 0 && topoSort->marked[v] != 1) {
        break;
      }
    }

    // Se nenhum vértice sem arestas incidentes for encontrado, o grafo tem um ciclo e não existe uma ordenação topológica válida
    if (v == topoSort->numVertices) {
      ACCESS++; // Acessando a memória para obter numVertices
      printf("The graph contains a cycle.\n");
      GraphDestroy(&gCopy);
      return topoSort;
    }

    // Imprimir o ID do vértice
    printf("Vertex ID: %u\n", v);

    // Adicionar o vértice v à ordenação topológica
    topoSort->vertexSequence[sequenceIndex++] = v;
    ACCESS++; // Acessando a memória para definir vertexSequence[sequenceIndex]
    ADDS++; // Incrementando sequenceIndex

    // Obtem a lista de adjacência do vértice
    unsigned int* adjacents = GraphGetAdjacentsTo(gCopy, v);
    ACCESS++; // Acessando a memória para obter adjacents

    // Apagar o vértice v de GCopy e as arestas que dele emergem
    for (unsigned int i = 1; i <= adjacents[0]; i++) {
      ITER++;
      GraphRemoveEdge(gCopy, v, adjacents[i]);
      ACCESS += 3;  // Acessando a memória para obter adjacents[i], adjacents[o] e remover a aresta
      ADDS++; // Incremento do i
    }
    topoSort->marked[v] = 1;
    ACCESS++;     // Acessando a memória para definir marked[v]
    free(adjacents);
  }

  topoSort->validResult = 1;
  ACCESS++; // Acessando a memória para definir marked[v]

  GraphDestroy(&gCopy);

  return topoSort;
}
// Check if a valid sorting was computed and set the isValid field
// For instance, by checking if the number of elements in the vertexSequence is
// the number of graph vertices
//
GraphTopoSort* GraphTopoSortComputeV2(Graph* g) {
  assert(g != NULL && GraphIsDigraph(g) == 1);

  // Create and initialize the struct

  GraphTopoSort* topoSort = _create(g);
  ACCESS++;   // Acessando a memória para criar topoSort
  
  // Build the topological sorting

  // TO BE COMPLETED


  // Registar num array auxiliar numIncomingEdges o InDegree de cada vértice
  for (unsigned int v = 0; v < topoSort->numVertices; v++) {
    ITER++;
    topoSort->numIncomingEdges[v] = GraphGetVertexInDegree(g, v);
    ACCESS++; // Acessando a memória para definir numIncomingEdges[v]
    ADDS ++; // Incremento do v
  }

  unsigned int sequenceIndex = 0;    
  unsigned int v;


  while (sequenceIndex < topoSort->numVertices) {   // Percorre todos os vértices do gráfico
    ACCESS++; // Acessando a memória para obter numVertices
    for (v = 0; v < topoSort->numVertices; v++) {
      ITER++;
      ACCESS += 2; // Acessando a memória para obter numVertices e marked[v]
      ADDS ++; // Incremento do v
      if (topoSort->numIncomingEdges[v] == 0 && topoSort->marked[v] != 1) {  // Selecionar vértice v com numIncomingEdges[v] == 0 E não marcado
        break;
      }
    }

    // Se nenhum vértice sem arestas incidentes for encontrado, o grafo tem um ciclo e não existe uma ordenação topológica válida
    if (v == topoSort->numVertices) {
      ACCESS++; // Acessando a memória para obter numVertices
      printf("The graph contains a cycle.\n");
      return topoSort;
    }

    // Imprimir o seu ID 
    printf("Vertex ID: %d\n",v);

    topoSort->vertexSequence[sequenceIndex++] = v;  // Adicionar o vértice v à ordenação topológica
    ACCESS++;// Acessando a memória para definir vertexSequence[sequenceIndex]
    ADDS++;// Incrementando sequenceIndex

    // Marcar o vértice como pertencente à ordenação
    topoSort->marked[v] = 1;
    ACCESS++; // Acessando a memória para definir marked[v]

    // Obtem a lista de adjacência do vértice
    unsigned int* adjacents = GraphGetAdjacentsTo(g, v);
    ACCESS++; // Acessando a memória para obter adjacents

    // Para cada vértice w adjacente a v
    for (unsigned int i = 1; i <= adjacents[0]; i++) { 
      ITER++;
      unsigned int w = adjacents[i];  
      topoSort->numIncomingEdges[w]--; // Decrementar o indegree de cada vértice adjacente a v
      ACCESS += 3;  // Acessando a memória para obter adjacents[i], adjacents[o] e remover a numIncomingEdges[w]
      ADDS+=2; // Decremento numIncomingEdges[w] e incremento do i
    }

    free(adjacents);
  }

  topoSort->validResult = 1; //Indicar que a ordenação topológica é válida
  ACCESS++; // Acessando a memória para definir validResult

  return topoSort;
}
//
// Computing the topological sorting, if any, using the 3rd algorithm
// Check if a valid sorting was computed and set the isValid field
// For instance, by checking if the number of elements in the vertexSequence is
// the number of graph vertices
//
GraphTopoSort* GraphTopoSortComputeV3(Graph* g) {
  assert(g != NULL && GraphIsDigraph(g) == 1);

  // Create and initialize the struct
  GraphTopoSort* topoSort = _create(g);
  ACCESS++; // Acessando a memória para criar topoSort

  // Build the topological sorting

  // TO BE COMPLETED
  //...

  // Registar num array auxiliar numEdgesPerVertex o InDegree de cada vértice
  unsigned int* numEdgesPerVertex = (unsigned int*)malloc(sizeof(unsigned int) * topoSort->numVertices);
  ACCESS++; // Acessando a memória para criar numEdgesPerVertex
  for (unsigned int v = 0; v < topoSort->numVertices; v++) {
    ITER++;
    numEdgesPerVertex[v] = GraphGetVertexInDegree(g, v);
    ACCESS++; // Acessando a memória para definir numEdgesPerVertex[v]
    ADDS++; // Incremento do v
  }

  // Criar FILA vazia e inserir na FILA os vértices v com numEdgesPerVertex[v] == 0
  Queue* queue = QueueCreate(topoSort->numVertices);
  ACCESS++; // Acessando a memória para criar queue
  for (unsigned int v = 0; v < topoSort->numVertices; v++) {
    ITER++;
    ACCESS++; // Acessando a memória para obter numVertices
    ADDS++; // Incremento do v
    if (numEdgesPerVertex[v] == 0) {
      QueueEnqueue(queue, v);
    }
  }
  unsigned int sequenceIndex = 0;
  while (!QueueIsEmpty(queue)) {
    unsigned int v = QueueDequeue(queue);

    topoSort->vertexSequence[sequenceIndex++] = v;
    ACCESS++; // Acessando a memória para definir vertexSequence[sequenceIndex]
    ADDS++; // Incrementando sequenceIndex

    printf("Vertex ID: %d\n", v);

    unsigned int* adjacents = GraphGetAdjacentsTo(g, v);
    ACCESS++; // Acessando a memória para obter adjacents

    for (unsigned int i = 1; i <= adjacents[0]; i++) {
      ITER++;
      unsigned int w = adjacents[i];

      numEdgesPerVertex[w]--;
      ACCESS += 3; // Acessando a memória para obter adjacents[i], adjacents[0] e decrementar numEdgesPerVertex[w]
      ADDS+=2; // Decrementando numEdgesPerVertex[w] e incremento do i

      if (numEdgesPerVertex[w] == 0) {
        QueueEnqueue(queue, w);
      }
    }
    free(adjacents);

  }

  free(numEdgesPerVertex);

  QueueDestroy(&queue);

  if (sequenceIndex != topoSort->numVertices) {
    ACCESS++; // Acessando a memória para obter numVertices
    printf("The graph contains a cycle.\n");
    topoSort->validResult = 0;
  } else {
    topoSort->validResult = 1;
  }

  ACCESS++; // Acessando a memória para definir validResult


  return topoSort;
}

void GraphTopoSortDestroy(GraphTopoSort** p) {
  assert(*p != NULL);

  GraphTopoSort* aux = *p;

  free(aux->marked);
  free(aux->numIncomingEdges);
  free(aux->vertexSequence);

  free(*p);
  *p = NULL;
}

//
// A valid sorting was computed?
//
int GraphTopoSortIsValid(const GraphTopoSort* p) { return p->validResult; }

//
// Getting an array containing the topological sequence of vertex indices
// Or NULL, if no sequence could be computed
// MEMORY IS ALLOCATED FOR THE RESULTING ARRAY
//
unsigned int* GraphTopoSortGetSequence(const GraphTopoSort* p) {
  assert(p != NULL);
  // TO BE COMPLETED
  // ...
  // Verificar se a ordenação topológica é válida
  if (p->validResult == 0) {
    printf("A ordenação topológica não é válida.\n");
    return NULL;
  }

  // Alocar memória para a sequência de ordenação topológica
  unsigned int* sequence = (unsigned int*)malloc(sizeof(unsigned int) * p->numVertices);

  // Copiar a sequência de ordenação topológica
  for (unsigned int i = 0; i < p->numVertices; i++) {
    sequence[i] = p->vertexSequence[i];
  }

  return sequence;
}

// DISPLAYING on the console

//
// The toplogical sequence of vertex indices, if it could be computed
//
void GraphTopoSortDisplaySequence(const GraphTopoSort* p) {
  assert(p != NULL);

  if (p->validResult == 0) {
    printf(" *** The topological sorting could not be computed!! *** \n");
    return;
  }

  printf("Topological Sorting - Vertex indices:\n");
  for (unsigned int i = 0; i < GraphGetNumVertices(p->graph); i++) {
    printf("%d ", p->vertexSequence[i]);
  }
  printf("\n");
}

//
// The toplogical sequence of vertex indices, if it could be computed
// Followed by the digraph displayed using the adjecency lists
// Adjacency lists are presented in topologic sorted order
//
void GraphTopoSortDisplay(const GraphTopoSort* p) {
  assert(p != NULL);

  // The topological order
  GraphTopoSortDisplaySequence(p);

  if (p->validResult == 0) {
    return;
  }

  // The Digraph
  for (unsigned int i = 0; i < GraphGetNumVertices(p->graph); i++) {
    GraphListAdjacents(p->graph, p->vertexSequence[i]);
  }
  printf("\n");
}
