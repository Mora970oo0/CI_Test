#include "Validate_Power.h"

int validate_power(float power){
    int checkCode = 0;
    if(power>0 && power <100){
        checkCode = 1;
    }
    return checkCode; 
}