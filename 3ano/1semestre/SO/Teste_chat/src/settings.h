/**
 * @brief Simulation parameter values.
 */

#ifndef SETTINGS_H
#define SETTINGS_H

#define FIFO_MAXSIZE 10
#define MAX_ID 100
#define MAX_PRIORITY 10
#define MAX_NAME 50
#define MAX_PEDIDOS 100
#define MAX_CHEFES 10
#define INVALID_ID -1
#define INVALID_PRIORITY -1
#define MAX_WAIT 5

#endif // SETTINGS_H
/**
 *  \brief patient id verification test
 */
#define check_valid_patient_id(id) do { if(id < 0 || id > MAX_ID) { printf("\e[31;01m[%s, line %d, function %s] ERROR: invalid patient ID %d!\e[0m\n", __FILE__, __LINE__, __FUNCTION__, id); exit(EXIT_FAILURE); } } while(0)

/**
 *  \brief nurse id verification test
 */
#define check_valid_nurse_id(id) do { if(id < 0 || id >= MAX_NURSES) { printf("\e[31;01m[%s, line %d, function %s] ERROR: invalid nurse ID %d!\e[0m\n", __FILE__, __LINE__, __FUNCTION__, id); exit(EXIT_FAILURE); } } while(0)

/**
 *  \brief doctor id verification test
 */
#define check_valid_doctor_id(id) do { if(id < 0 || id >= MAX_DOCTORS) { printf("\e[31;01m[%s, line %d, function %s] ERROR: invalid doctor ID %d!\e[0m\n", __FILE__, __LINE__, __FUNCTION__, id); exit(EXIT_FAILURE); } } while(0)

/**
 *  \brief priority verification test
 */
#define check_valid_priority(priority) do { if(priority < 1 || priority > MAX_PRIORITY) { printf("\e[31;01m[%s, line %d, function %s] ERROR: invalid priority %d!\e[0m\n", __FILE__, __LINE__, __FUNCTION__, priority); exit(EXIT_FAILURE); } } while(0)

/**
 *  \brief patient name verification test
 */
#define check_valid_name(name) do { if(name[0] == '\0') { printf("\e[31;01m[%s, line %d, function %s] ERROR: invalid patient with name \"%s\"!\e[0m\n", __FILE__, __LINE__, __FUNCTION__, name); exit(EXIT_FAILURE); } } while(0)

