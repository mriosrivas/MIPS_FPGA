#include "trafo.h"
#include "types.h"



void RGB2GrayMatrix(pixelRGB orig[], unsigned char dest[], int nrows, int ncols) {
    int i,j;

    for (i=0;i<nrows;i++)
        for (j=0; j<ncols; j++)
            dest[i*ncols+j] =  rgb2grayAssembly(&orig[i*ncols+j]);

}


unsigned char rgb2gray(pixelRGB* pixel) {
    unsigned char c = (3483* pixel->R + 11718*pixel->G  + 1183*pixel->B) /16384;
    return  c;
}


void computeHistogram(unsigned char GrayImage[],short int histogram[],int nrows,int ncols) {
    int i,j;

    for (i=0; i< 255; i++)
            histogram[i]=0;

    for (i=0;i<nrows;i++)
        for (j=0; j<ncols; j++)
            histogram[GrayImage[i*ncols+j]]++;
}


unsigned char computeThreshold(short int histogram[]) {
 short int max=-1, max2=-1;
 int max_idx=-1, max2_idx=-1;
 int i;
 int mid;

 for (i=0;i<128;i++) {
     if (histogram[i] > max) {
         max = histogram[i];
         max_idx = i;
     }
 }
 for (i=128;i<255;i++) {
     if (histogram[i] > max2) {
         max2 = histogram[i];
         max2_idx = i;
     }
 }

  mid = max_idx + (max2_idx - max_idx)/2;
  return mid;
}


void Gray2BinaryMatrix(unsigned char orig[], unsigned char dest[], unsigned char threshold, int nrows, int ncols) {
    int i,j;

    for (i=0;i<nrows;i++)
        for (j=0; j<ncols; j++)
            if (orig[i*ncols+j] > threshold)
                dest[i*ncols+j]=0xFF;
            else
                 dest[i*ncols+j]=0;

}