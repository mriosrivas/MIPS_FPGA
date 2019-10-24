#include "trafo.h"
#include "types.h"
#include "lena128color.h"


#define LENA


#ifdef LENA
#define N 128
#define M 128
pixelRGB* RGBimage;
#else
#define N 16
#define M 16
pixelRGB RGBimage[N*M];
#endif


unsigned char GrayImage[N*M];
unsigned char BinaryImage[N*M];
short int histogram[256];


void initRGB(int nrows, int ncols) {
    #ifndef LENA
        int i,j;

        for (i=0;i<nrows;i++)
            for (j=0; j<ncols; j++) {
                RGBimage[i*ncols+j].R = (i+j)%256;
                RGBimage[i*ncols+j].G = (i+j)%256;
                RGBimage[i*ncols+j].B = (i+j)%256;
            }
    #else
        RGBimage = (pixelRGB*) imageLena;
    #endif
}



int main() {
    unsigned char threshold;

    /* Image initialization */
    initRGB(N,M);

    /* RGB to Grayscale */
    RGB2GrayMatrix(RGBimage,GrayImage,N,M);

    /* Grayscale to Binary */
    computeHistogram(GrayImage,histogram,N,M);
    threshold= computeThreshold(histogram);
    Gray2BinaryMatrix(GrayImage,BinaryImage,threshold,N,M);


    return 0;
}
