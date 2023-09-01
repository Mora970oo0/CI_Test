#include "..\APP\MEAS\Measurement.h"
#include "..\APP\POWER\Validate_Power.h"

// States
typedef enum {
    No_init,
    Init,
    Measurement_Curr_Volt,
    Power_Analysis,
    Error
} State;

int main() {
    State state = No_init;

    while (1) {
        switch (state) {
            case No_init:
                printf("State: No_init\n");
                state = Init;
                break;

            case Init:
                printf("State: Init\n");
                state = Measurement_Curr_Volt;
                break;

            case Measurement_Curr_Volt:
                printf("State: Measurement_Curr_Volt\n");
                float voltage = read_voltage();
                float current = read_current();
                break;

            case Power_Analysis:
                printf("State: Power_Analysis\n");
                float power = voltage * current;
                if (validate_power(power)) {
                    printf("Works properly. power: %.2f\n", power);
                } 
                else {
                    printf("Power too high or too low. power: %.2f\n", power);
                }
                state = Error;
                break;

            case Error:
                printf("State: Error\n");

                return 0;
        }
    }

    return 0;
}
