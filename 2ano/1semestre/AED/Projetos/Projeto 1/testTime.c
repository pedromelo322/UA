#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "error.h"
#include <assert.h>

#include "image8bit.h"
#include "instrumentation.h"


int main(int argc, char *argv[]) {
    // Check the number of arguments
    if (argc < 4) {
        fprintf(stderr, "Usage: %s <image_file> <operation> <parameters>\n", argv[0]);
        return 1;
    }
    


    // Load an image
    Image img = ImageLoad(argv[1]);
    if (img == NULL) {
        perror("Failed to load image");
        return 1;
    }

    // Check the operation
    if (strcmp(argv[2], "blur") == 0) {
        // Parse the parameters
        int radiusX, radiusY;
        if (sscanf(argv[3], "%d,%d", &radiusX, &radiusY) != 2) {
            fprintf(stderr, "Invalid parameters for blur: %s\n", argv[3]);
            ImageDestroy(&img);
            return 1;
        }

        double start_time = cpu_time();
        ImageBlur(img, radiusX, radiusY);
        double finish_time = cpu_time();
        printf("Number of Sums: %ld\n", SUMS);
        printf("Number of MULTS: %ld\n", MUL);
        double exec_time = finish_time - start_time;
        printf("Execution time: %f\n", exec_time);


    } else if (strcmp(argv[2], "locate") == 0) {
        // Parse the parameters
        int posX = 0, posY = 0; // Initialize X and Y

        // Load the subimage
        Image subimg = ImageLoad(argv[3]);
        if (subimg == NULL) {
            perror("Failed to load subimage");
            ImageDestroy(&img);
            return 1;
        }

        double start_time = cpu_time();
        int result = ImageLocateSubImage(img, &posX, &posY, subimg);
        printf("Number of comparations: %ld\n", COMP);
        double finish_time = cpu_time();
        double exec_time = finish_time - start_time;
        printf("Execution time: %f\n", exec_time);

        // Check the result
        if (result == 1) {
            printf("Subimage found\n");
            printf("Position: %d,%d\n", posX, posY);
        } else if (result == 0) {
            printf("Subimage not found\n");
        } else {
            fprintf(stderr, "Error occurred during subimage location\n");
        }

        // Free the subimage
        ImageDestroy(&subimg);
    } else {
        fprintf(stderr, "Unknown operation: %s\n", argv[2]);
        ImageDestroy(&img);
        return 1;
    }


    

    if (argc > 4 && strcmp(argv[4],"save") == 0){
        if (ImageSave(img, argv[5]) == 0) {
            error(2, errno, "%s: %s", argv[5], ImageErrMsg());
        }
    }

    // Free the image
    ImageDestroy(&img);


    return 0;
}
