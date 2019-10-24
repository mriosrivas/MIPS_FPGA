#ifndef _TRAFO_H
#define _TRAFO_H

#include "types.h"


void RGB2GrayMatrix(pixelRGB orig[], unsigned char dest[], int nfilas, int ncols);

unsigned char rgb2gray(pixelRGB* pixel);

void Gray2BinaryMatrix(unsigned char orig[], unsigned char dest[], unsigned char umbral, int nfilas, int ncols);

void computeHistogram(unsigned char GrayImage[],short int histogram[],int N,int M);

unsigned char computeThreshold(short int histogram[]);

extern unsigned char rgb2grayAssembly(pixelRGB* pixel);

#endif
