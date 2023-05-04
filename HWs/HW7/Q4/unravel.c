#include "mex.h"

void unravel(uint16_T *hx, double *link, double *x, double xsz, int hxsz)
{
    int i=15,j=0,k=0,n=0;
    
    while (xsz - k){
        if (*(link+n)>0) {
            if ((*(hx+j) >> i) & 0x0001)
                n = *(link+n);
            else n = *(link+n) -1;
            if (i) i--; else {j++;i=15;}
            if (j > hxsz)
                mexErrMsgTxt("out of code bits");
        }
        else {
            *(x + k++) = - *(link + n);
            n = 0;
        }
        if ( k== xsz - 1)
            *(x + k++) = - *(link + n);
    }
}
    
    void mexFunction(int nlhs, mxArray *plhs[],
            int nrhs, const mxArray *prhs[])
    {
        double *link, *x, xsz;
        uint16_T *hx;
        int hxsz;
        
        hx = (uint16_T *) mxGetData(prhs[0]);
        link = (double *) mxGetData(prhs[1]);
        xsz = mxGetScalar(prhs[2]);
        
        hxsz = mxGetM(prhs[0]);
        
        plhs[0] = mxCreateDoubleMatrix(xsz,1,mxREAL);
        
        x = (double *) mxGetData(plhs[0]);
        
        unravel(hx,link,x,xsz,hxsz);
    }
        

