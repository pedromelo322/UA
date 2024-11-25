#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

#include "linked-list.h"

/*******************************************************/

SllNode* sllDestroy(SllNode* list)
{

    SllNode *current = list;
    SllNode *next = NULL;

    while(current != NULL){
        next = current -> next;
        free(current -> reg.name);
        free(current);
        current = next;
    }


    return NULL;
}

/*******************************************************/

void sllPrint(SllNode *list, FILE *fout)
{

    SllNode *current = list;
    while (current != NULL){
        printf("%d, %s\n",current-> reg.nmec, current -> reg.name);
        current = current->next;
    }

}

/*******************************************************/

SllNode* sllInsert(SllNode* list, uint32_t nmec, const char *name)
{
    assert(name != NULL && name[0] != '\0');
    assert(!sllExists(list, nmec));

    SllNode *current = list;
    SllNode *newNode = (SllNode*)malloc(sizeof(SllNode));
    if(newNode == NULL){
        return list;
    }

    newNode -> reg.nmec = nmec;

    newNode -> reg.name = (char*)malloc(strlen(name)+1);
    if (newNode == NULL){
        free(newNode);
        return list;
    }

    strcpy(newNode -> reg.name, name);

    if(current == NULL){
        newNode -> next = NULL;
        return newNode;
    }

    if(current -> reg.nmec > nmec){
        newNode -> next = current;
        return newNode;
    }

    while(current -> next != NULL && current -> next -> reg.nmec < nmec){
        current = current -> next;
    }

    newNode -> next = current -> next;

    current -> next = newNode;


    return list;
}

/*******************************************************/

bool sllExists(SllNode* list, uint32_t nmec)
{

    SllNode *current = list;

    while(current != NULL){
        if(current -> reg.nmec == nmec){
            return true;
        }else{
            current = current -> next;
        }
    }



    return false;
}

/*******************************************************/

SllNode* sllRemove(SllNode* list, uint32_t nmec)
{
    assert(list != NULL);
    assert(sllExists(list, nmec));

    SllNode *current = list;

    SllNode *previous = NULL;

    while(current != NULL && current -> reg.nmec != nmec){
        previous = current;
        current = current -> next;
    }


    if(previous == NULL){
        list = current -> next;
    }else{
        previous -> next = current -> next;
    }

    free(current -> reg.name);
    free(current);

    


    return list;
}

/*******************************************************/

const char *sllGetName(SllNode* list, uint32_t nmec)
{
    assert(list != NULL);
    assert(sllExists(list, nmec));

    SllNode *current = list;

    while(current -> next != NULL && current -> reg.nmec != nmec){
        current = current -> next;
    }

    return current->reg.name;
}

/*******************************************************/

SllNode* sllLoad(SllNode *list, FILE *fin, bool *ok)
{
    assert(fin != NULL);

    if (ok != NULL)
       *ok = false; // load failure

    uint32_t nmec;
    char name[80];

    while (fscanf(fin, "%u;%[^\n]", &nmec, name) == 2)
    {
        list = sllInsert(list, nmec, name);
    }

    if (ok != NULL)
       *ok = true; // load success


    return list;
}

/*******************************************************/

