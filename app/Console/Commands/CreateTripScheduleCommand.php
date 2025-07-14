<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Trip;
use App\Models\TripSchedule;
use App\Models\Bus;
use App\Models\TripBusAssignment;

class CreateTripScheduleCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'trip:create-schedule {trip_id} {travel_date} {bus_id}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a trip schedule and assign a bus';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $tripId = $this->argument('trip_id');
        $travelDate = $this->argument('travel_date');
        $busId = $this->argument('bus_id');

        $trip = Trip::find($tripId);
        if (!$trip) {
            $this->error('Trip not found');
            return 1;
        }

        $bus = Bus::find($busId);
        if (!$bus) {
            $this->error('Bus not found');
            return 1;
        }

        // Create trip schedule
        $schedule = TripSchedule::create([
            'trip_id' => $tripId,
            'travel_date' => $travelDate,
            'departure_time' => $trip->departure_time,
            'arrival_time' => $trip->arrival_time
        ]);

        // Assign bus to trip
        TripBusAssignment::create([
            'trip_schedule_id' => $schedule->id,
            'bus_id' => $busId
        ]);

        $this->info("Trip schedule created successfully with ID: {$schedule->id}");
        return 0;
    }
}
