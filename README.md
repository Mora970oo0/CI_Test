CMD commands:
- Compiling several .c
    gcc -o app SOURCE/main/main.c SOURCE/APP/MEAS/Measurement.c SOURCE/APP/POWER/Validate_Power.c

- Compiling and save warning and errors
    gcc -o SOURCE/out/app SOURCE/main/main.c SOURCE/APP/MEAS/Measurement.c SOURCE/APP/POWER/Validate_Power.c 2>&1 | tee SOURCE/log

- Add comments on log file:
    echo "COMMITS" >> SOURCE/log
- Count errors
     grep -c "error" > errores.txt
     grep -c "error" >> SOURCE/log
- Count warnings
    grep -c "warning" > warnings.txt
    grep -c "warning" >> SOURCE/log

HOW TO USE THIS SCRIPT:
1) Execute on Linux shell from root of this project this shell script:
- \. build.sh
This script should do:
* Delete the log file and app.exe file if they exist.
* Compile the code and show by terminal and log the warnings and errors.
* Show by terminal or log if the compilation process is successful.
* Display the number of warnings and errors in the code.
