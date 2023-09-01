#include "Measurement.h"

float read_voltage(){
    float voltage = 0;
    printf("Select voltage: ");
    scanf("%f", &voltage);
    return voltage; 
}

float read_current(){
    float current = 0;
    printf("Select current: ");
    scanf("%f", &current);  
    return current;  
}