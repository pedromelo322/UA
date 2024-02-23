#include <stdio.h>
#include <stdlib.h>
#include "Guiao_07_Ficheiros_para_os_Estudantes/03_STACK_and_QUEUE_example/PointersQueue.c"
#include "Guiao_07_Ficheiros_para_os_Estudantes/03_STACK_and_QUEUE_example/PointersStack.c"
#include "Guiao_07_Ficheiros_para_os_Estudantes/02_DATE_and_PERSON/Date.c"
#include "Guiao_07_Ficheiros_para_os_Estudantes/02_DATE_and_PERSON/Person.c"

int main() {

    Queue* personQueue = QueueCreate(10);
    Stack* personStack = StackCreate(10);
    Queue* dateQueue = QueueCreate(10);
    Stack* dateStack = StackCreate(10);


    Date* date1 = DateCreate(2023, 11, 19);
    Date* date2 = DateCreate(2023, 11, 20);
    Date* date3 = DateCreate(2023, 11, 21);

    Person* person1 = PersonCreate("John", "Doe", 1980, 1, 1);
    Person* person2 = PersonCreate("Jane", "Doe", 1985, 2, 2);
    Person* person3 = PersonCreate("Jim", "Doe", 1990, 3, 3);

    QueueEnqueue(dateQueue, date1);
    QueueEnqueue(dateQueue, date2);
    QueueEnqueue(dateQueue, date3);

    StackPush(dateStack, date1);
    StackPush(dateStack, date2);
    StackPush(dateStack, date3);

    QueueEnqueue(personQueue, person1);
    QueueEnqueue(personQueue, person2);
    QueueEnqueue(personQueue, person3);

    StackPush(personStack, person1);
    StackPush(personStack, person2);
    StackPush(personStack, person3);

    while (!QueueIsEmpty(dateQueue)) {
        Date* dequeuedDate = (Date*)QueueDequeue(dateQueue);
        printf("Date from Queue: %s\n", DateFormat(dequeuedDate, YMD));
        DateDestroy(&dequeuedDate);
    }

    while (!StackIsEmpty(dateStack)) {
        Date* dequeuedDate = (Date*)QueueDequeue(dateQueue);
        printf("Date from Queue: %s\n", DateFormat(dequeuedDate, YMD));
        DateDestroy(&dequeuedDate);
    }

    while (!QueueIsEmpty(personQueue)) {
        Person* person = QueueDequeue(personQueue);
        PersonPrintf(person, &"a");
        PersonDestroy(&person);
    }

    while (!StackIsEmpty(personStack)) {
        Person* person = StackPop(personStack);
        PersonPrintf(person, &"A");
        PersonDestroy(&person);
    }

    QueueDestroy(&dateQueue);
    StackDestroy(&dateStack);
    QueueDestroy(&personQueue);
    StackDestroy(&personStack);

    return 0;
}
