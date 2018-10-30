#!/bin/bash
get_time_until_charged() {
    # parses acpitool's battery info for the remaining charge of all batteries and sums them up
    sum_remaining_charge=$(acpitool -B | grep -E 'Remaining capacity' | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc);
    # finds the rate at which the batteries being drained at
    present_rate=$(acpitool -B | grep -E 'Present rate' | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc);
    # divides current charge by the rate at which it's falling, then converts it into seconds for `date`
    seconds=$(bc <<< "scale = 10; ($sum_remaining_charge / $present_rate) * 3600");
    # prettifies the seconds into h:mm:ss format
    pretty_time=$(date -u -d @${seconds} +%T);
    echo $pretty_time;
}
get_battery_combined_percent() {
    total_charge=$(expr $(acpi -b | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc));
    battery_number=$(acpi -b | wc -l);
    percent=$(expr $total_charge / $battery_number);
    echo $percent;
}
time=$(get_time_until_charged)
perc=$(get_battery_combined_percent)
output="$perc%"
charging=$(acpi -b | grep -c Discharging)
if [ ! $charging -eq 1 ]
then echo " $perc%"
elif (( $perc > '75' ))
then echo " $output"
elif (( $perc > '50' ))
then echo " $output"
elif (( $perc > '25' ))
then echo " $perc%"
elif  (( $perc > '10' ))
then echo " $perc%"
else
echo " $perc%"
fi

case $BLOCK_BUTTON in
	3) mate-power-statistics ;;
esac
