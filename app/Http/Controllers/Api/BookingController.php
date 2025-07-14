<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\BookingService;


use App\Http\Resources\AvailableSeatResource;
use App\Http\Requests\GetAvailableSeatsRequest;
use App\Http\Requests\BookSeatRequest;
use App\Http\Resources\BookingResource;

class BookingController extends Controller
{
    private $bookingService;

    public function __construct(BookingService $bookingService)
    {
        $this->bookingService = $bookingService;
    }

    public function getUserBookings()
    {
        $bookings = auth()->user()->bookings()
            ->with(['tripSchedule.trip', 'startCity', 'endCity', 'busSeat'])
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json([
            'success' => true,
            'data' => BookingResource::collection($bookings)
        ]);
    }

    public function getAvailableSeats(GetAvailableSeatsRequest $request)
    {
        try {
            $availableSeats = $this->bookingService->getAvailableSeats(
                $request->start_city_id,
                $request->end_city_id,
                $request->travel_date
            );

            return response()->json([
                'success' => true,
                'data' => AvailableSeatResource::collection(collect($availableSeats)->map(function ($seat) {
                    return (object) $seat;
                })),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error retrieving available seats',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function bookSeat(BookSeatRequest $request)
    {
        try {
            $booking = $this->bookingService->bookSeat(
                auth()->id(),
                $request->trip_schedule_id,
                $request->seat_id,
                $request->start_city_id,
                $request->end_city_id
            );

            return response()->json([
                'success' => true,
                'message' => 'Seat booked successfully',
                'data' => new BookingResource($booking)
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Booking failed',
                'error' => $e->getMessage()
            ], 400);
        }
    }
}
