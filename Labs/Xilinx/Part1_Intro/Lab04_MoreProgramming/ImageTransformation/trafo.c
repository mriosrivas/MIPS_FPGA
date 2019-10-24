#include "trafo.h"
#include "types.h"



void RGB2GrayMatrix(pixelRGB orig[], unsigned char dest[], int nrows, int ncols) {
    int i,j;

    for (i=0;i<nrows;i++)
        for (j=0; j<ncols; j++)
            dest[i*ncols+j] =  rgb2gray(&orig[i*ncols+j]);

}


unsigned char rgb2gray(pixelRGB* pixel) {
    // COMPLETE THIS FUNCTION
}


void computeHistogram(unsigned char GrayImage[],short int histogram[],int nrows,int ncols) {
    // COMPLETE THIS FUNCTION
}


unsigned char computeThreshold(short int histogram[]) {
    // COMPLETE THIS FUNCTION
}


void Gray2BinaryMatrix(unsigned char orig[], unsigned char dest[], unsigned char threshold, int nrows, int ncols) {
    // COMPLETE THIS FUNCTION
}