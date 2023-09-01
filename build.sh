echo Remove old log file >> SOURCE/log
if [ -e "SOURCE/log" ]; then
    rm "SOURCE/log"
fi
if [ -e "SOURCE/out/app.exe" ]; then
    rm "SOURCE/out/app.exe"
fi
echo "--------------------------------------" >> SOURCE/log
echo "Start compilation for Jenkins example:" >> SOURCE/log
echo "--------------------------------------" >> SOURCE/log
gcc -o SOURCE/out/app SOURCE/main/main.c SOURCE/APP/MEAS/Measurement.c SOURCE/APP/POWER/Validate_Power.c 2>&1 | tee -a SOURCE/log
echo "Finish compilation" >> SOURCE/log
echo "--------------------------------------" >> SOURCE/log
echo RESULTS ARE: >> SOURCE/log
warnings=$(gcc -o SOURCE/out/app SOURCE/main/main.c SOURCE/APP/MEAS/Measurement.c SOURCE/APP/POWER/Validate_Power.c 2>&1 | grep -c "warning")
echo "WARNINGS: $warnings" >> SOURCE/log
errors=$(gcc -o SOURCE/out/app SOURCE/main/main.c SOURCE/APP/MEAS/Measurement.c SOURCE/APP/POWER/Validate_Power.c 2>&1 | grep -c "error")
echo "ERRORS: $errors" >> SOURCE/log
echo "--------------------------------------" >> SOURCE/log
if [ $errors -eq 0 ]; then
    echo "COMPILING SUCCESSFUL!." >> SOURCE/log
else
    echo "NOT BE ABLE TO COMPILE" >> SOURCE/log
fi