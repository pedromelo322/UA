/**
 * @file train.h
 * @brief Train interface (irrelevant code, synchronization required)
 *      enter train (if possible), returns TRAIN_FULL (no blocking)
 *      decrement departure time counts down to zero making the train to
 *      leave
 *      train arrives to destination, notify all passengers to leave train (irrelevant order)
 */

#ifndef TRAIN_H
#define TRAIN_H

#include <stdio.h>
#include "settings.h"

// TODO point: uncomment the desired implementation
#include "thread.h"
// #include "process.h"


typedef struct {
    char name[5];                      // train identification (TNNN: T001, ...)
    int pass_id[MAX_TRAIN_NUM_SEATS];   // passenger ID (works as an index in array all_passengers)
    int total_num_seats;                // number of seats available
    int num_seats_occupied;             // number of seats already taken
    int time_to_departure;              // countdown time to departure
    int in_transit;                     // true if train in transit, false if in station
    // TODO point: if necessary, add synchronization declarations here

    pthread_mutex_t access;
    pthread_cond_t NotFull;
    pthread_cond_t arrived;

} Train;

extern void notify_passenger_of_train_arrival(int pass_id); // pass_id is passenger identification

void init_train(Train* train, int total_num_seats, int time_to_departure);
void term_train(Train* train);                              // function (unimplemented in metro module)
int enter_train(Train* train, int pass_id);                 // returns seat number (TRAIN_FULL if train is full)
int decrement_departure_time(Train* train);                 // train leaves station when time_to_departure reaches zero
void train_arrived_destination(Train* train);               // when that happens, it returns 1
                                                            // train arrives to destination, notify all passengers                                                  // to leave train (irrelevant order)
#endif
