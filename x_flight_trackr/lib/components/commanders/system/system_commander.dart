import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/flap_slider.dart';
import 'package:x_flight_trackr/components/commanders/system/gear_switcher.dart';
import 'package:x_flight_trackr/components/commanders/system/parking_brake_switcher.dart';
import 'package:x_flight_trackr/components/commanders/system/auto_brake_rotary_switcher.dart';
import 'package:x_flight_trackr/components/commanders/system/speed_brake_slider.dart';
import 'package:x_flight_trackr/components/commanders/system/throttle_slider.dart';
import 'package:x_flight_trackr/services/commanders/system_service.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';
import 'package:x_flight_trackr/store/systems_commander_store.dart';

class SystemCommander extends StatelessWidget {
  final FlightPlanStore flightPlanStore;
  final SystemsCommanderStore systemsCommanderStore;
  final SystemService systemService;

  SystemCommander({
    super.key,
    required this.flightPlanStore,
    required this.systemsCommanderStore,
  }) : systemService = SystemService(commander: systemsCommanderStore.command);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.65),
      ),
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ParkingBrakeSwitcher(
            onChanged: (value) =>
                systemService.setParkingBrakes(value as double),
            value: systemsCommanderStore.parkingBrakePosition.toInt(),
          ),
          AutoBrakeRotarySwitcher(
            onChanged: (value) => systemService.setAutoBrakes(value as double),
          ),
          SpeedBrakeSlider(
            onChanged: (value) => systemService.setSpeedBrakes(value),
          ),
          ThrottleSlider(
              onChanged: (value) =>
                  systemService.setReverseThrustOrThrottle(value)),
          FlapSlider(onChanged: (value) => systemService.setFlaps(value)),
          GearSwitcher(
            onChange: (value) => systemService.setGearUpDown(
              value == 1 ? GearPosition.UP : GearPosition.DOWN,
            ),
          ),
        ],
      ),
    );
  }
}
