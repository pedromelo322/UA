/// Supporting functions: passenger_enters_station
/// initStation, closeStation, terminateStation
///
/// The following operations are supported by this module:
/// initStation() // initialize station
/// closeStation() // close station
/// terminateStation // end the simulation (no synchronization required)
/// get_next_train() // define the next train entity for the arrival of the next train
/// train_departure // departure of a train (where possible)
/// passenger_enters_station_and_wait_next_train() // define the next train, where passenger takes next seat if next train (if possible, i.e. while station is open)

#ifndef STATION_H
#define STATION_H

#include <pthread.h>
#include "train.h"
#include "station.h"

typedef struct
{
    Train* train; // current train in station (set a new train should be an atomic operation)
    int total_num_seats; // total number of seats of current train (0 if no train in station)
    int num_seats_occupied; // number of occupied seats of current train (0 if no train in station)
    int open; // is station open (a closed station prevents next train arrival if no train in station)
    /// TODO point: if necessary, add synchronization declarations here

    pthread_mutex_t access;
    pthread_cond_t notFull;

} Station;

void init_station(Station* station);
void term_station(Station* station);
void close_station(Station* station);
void set_next_train(Station* station, Train* train);
void train_departure(Station* station);
int passenger_enters_station_and_wait_next_train(Station* station, int pass_id); // returns seat number
int passenger_seat_assign(Station* station, int pass_id); // Adicionar declaração da função

#endif
