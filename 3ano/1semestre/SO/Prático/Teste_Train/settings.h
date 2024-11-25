/**
 * @brief Simulation parameter values
 */
#ifndef SETTINGS_H
#define SETTINGS_H

#include <stdio.h>
#include <stdlib.h>

/** 
 * @brief Maximum passenger name length
 */
#define MAX_NAME 32

/** 
 * @brief Maximum number of passengers
 */
#define MAX_PASSENGERS 100

/** 
 * @brief Maximum number of trains
 */
#define MAX_TRAINS 20

/** 
 * @brief Number of seats per train
 */
#define MAX_TRAIN_NUM_SEATS 10

/** 
 * @brief Maximum departure time (measured in number of ticks)
 */
#define MAX_DEPARTURE_TIME 20

/** 
 * @brief Maximum time (in microseconds) in random waits
 */
#define MAX_WAIT 100000

/** 
 * @brief Maximum countdown tick (in microseconds)
 */
#define MAX_COUNTDOWN_TICK 1000000

/** 
 * @brief Dummy seat number (can be used to terminate simulation)
 */
#define DUMMY_SEAT MAX_TRAIN_NUM_SEATS

/** 
 * @brief Train full indication
 */
#define TRAIN_FULL (-1)

/** 
 * @brief Maximum value accepted for an ID
 */
#define MAX_ID (MAX_PASSENGERS - 1)

/** 
 * @brief Invalid seat number
 */
#define INVALID_SEAT 88888888

/** 
 * @brief Invalid ID number
 */
#define INVALID_ID 99999999

/** 
 * @brief Passenger ID verification test
 */
#define check_valid_passenger_id(id) do { if(id <= 0 || id > MAX_ID) { printf("Error: Invalid passenger ID\n"); exit(EXIT_FAILURE); } } while(0)

/** 
 * @brief Train ID verification test
 */
#define check_valid_train_id(id) do { if(id <= 0 || id > MAX_TRAINS) { printf("Error: Invalid train ID\n"); exit(EXIT_FAILURE); } } while(0)

/** 
 * @brief Passenger/train name verification test
 */
#define check_valid_name(name, type) do { if(name[0] == '\0') { printf("\e[31;01m[%s, line %d, function %s] ERROR: invalid patient with name \"%s\"!\e[0m\n", __FILE__, __LINE__, __FUNCTION__, name); exit(EXIT_FAILURE); } } while(0)
/** 
 * @brief Seat number verification test
 */
#define check_valid_seat(seat) do { if((seat < 0 || seat >= MAX_TRAIN_NUM_SEATS) && seat != DUMMY_SEAT) { printf("Error: Invalid seat number\n"); exit(EXIT_FAILURE); } } while(0)

#endif
