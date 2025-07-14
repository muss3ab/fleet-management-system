<?php

namespace App\Services;

use App\Models\Booking;
use App\Models\TripSchedule;
use App\Models\BusSeat;
use App\Models\City;
use Illuminate\Support\Facades\DB;

class BookingService
{
    public function getAvailableSeats($startCityId, $endCityId, $travelDate)
    {
        $availableSeats = [];

        // Find trip schedules that have routes containing both cities
        $tripSchedules = TripSchedule::with(['trip', 'busAssignment.bus.seats'])
            ->whereDate('travel_date', $travelDate)
            ->where('is_active', true)
            ->get()
            ->filter(function ($schedule) use ($startCityId, $endCityId) {
                return $schedule->trip->isValidRoute($startCityId, $endCityId);
            });

        foreach ($tripSchedules as $schedule) {
            $bus = $schedule->getBus();
            if (!$bus) continue;

            $occupiedSeats = $this->getOccupiedSeatsForRoute($schedule->id, $startCityId, $endCityId);

            foreach ($bus->seats as $seat) {
                if (!in_array($seat->id, $occupiedSeats) && $seat->is_active) {
                    $availableSeats[] = [
                        'trip_schedule_id' => $schedule->id,
                        'seat_id' => $seat->id,
                        'seat_number' => $seat->seat_number,
                        'trip_name' => $schedule->trip->name,
                        'departure_time' => $schedule->departure_time,
                        'arrival_time' => $schedule->arrival_time,
                        'price' => $schedule->trip->calculatePrice($startCityId, $endCityId)
                    ];
                }
            }
        }

        return $availableSeats;
    }

    private function getOccupiedSeatsForRoute($tripScheduleId, $startCityId, $endCityId)
    {
        $trip = TripSchedule::find($tripScheduleId)->trip;
        $route = $trip->route;

        $startIndex = array_search($startCityId, $route);
        $endIndex = array_search($endCityId, $route);

        $occupiedSeats = [];

        // Check all existing bookings for this trip schedule
        $bookings = Booking::where('trip_schedule_id', $tripScheduleId)
            ->where('status', '!=', 'cancelled')
            ->get();

        foreach ($bookings as $booking) {
            $bookingStartIndex = array_search($booking->start_city_id, $route);
            $bookingEndIndex = array_search($booking->end_city_id, $route);

            // Check if routes overlap
            if ($this->routesOverlap($startIndex, $endIndex, $bookingStartIndex, $bookingEndIndex)) {
                $occupiedSeats[] = $booking->bus_seat_id;
            }
        }

        return array_unique($occupiedSeats);
    }

    private function routesOverlap($start1, $end1, $start2, $end2)
    {
        return !($end1 <= $start2 || $end2 <= $start1);
    }

    public function bookSeat($userId, $tripScheduleId, $seatId, $startCityId, $endCityId)
    {
        return DB::transaction(function () use ($userId, $tripScheduleId, $seatId, $startCityId, $endCityId) {
            $tripSchedule = TripSchedule::with('trip')->find($tripScheduleId);

            if (!$tripSchedule || !$tripSchedule->is_active) {
                throw new \Exception('Trip schedule not found or inactive');
            }

            if (!$tripSchedule->trip->isValidRoute($startCityId, $endCityId)) {
                throw new \Exception('Invalid route for this trip');
            }

            $seat = BusSeat::find($seatId);
            if (!$seat || !$seat->is_active) {
                throw new \Exception('Seat not found or inactive');
            }

            // Check if seat is available for this route
            $occupiedSeats = $this->getOccupiedSeatsForRoute($tripScheduleId, $startCityId, $endCityId);
            if (in_array($seatId, $occupiedSeats)) {
                throw new \Exception('Seat is not available for this route');
            }

            $price = $tripSchedule->trip->calculatePrice($startCityId, $endCityId);

            $booking = Booking::create([
                'user_id' => $userId,
                'trip_schedule_id' => $tripScheduleId,
                'bus_seat_id' => $seatId,
                'start_city_id' => $startCityId,
                'end_city_id' => $endCityId,
                'price' => $price,
                'status' => 'confirmed'
            ]);

            return $booking;
        });
    }
}
