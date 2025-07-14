<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\{
    User,
    City,
    Trip,
    Bus,
    TripSchedule,
};
use App\Models\TripBusAssignment;

class BookingServiceTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        $this->seed();
    }

    public function test_can_get_available_seats_via_api()
    {
        $user = User::factory()->create();
        $cairo = City::where('code', 'CAI')->first();
        $asyut = City::where('code', 'ASY')->first();
        $trip = Trip::first();
        $bus = Bus::first();

        // Create trip schedule
        $schedule = TripSchedule::create([
            'trip_id' => $trip->id,
            'travel_date' => now()->addDay(),
            'departure_time' => '08:00',
            'arrival_time' => '14:00'
        ]);

        // Assign bus to trip
        TripBusAssignment::create([
            'trip_schedule_id' => $schedule->id,
            'bus_id' => $bus->id
        ]);

        $response = $this->actingAs($user, 'sanctum')
            ->getJson('/api/available-seats?' . http_build_query([
                'start_city_id' => $cairo->id,
                'end_city_id' => $asyut->id,
                'travel_date' => now()->addDay()->format('Y-m-d')
            ]));

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'data' => [
                    '*' => [
                        'trip_schedule_id',
                        'seat_id',
                        'seat_number',
                        'trip_name',
                        'departure_time',
                        'arrival_time',
                        'price'
                    ]
                ]
            ]);
    }

    public function test_can_book_seat_via_api()
    {
        $user = User::factory()->create();
        $cairo = City::where('code', 'CAI')->first();
        $asyut = City::where('code', 'ASY')->first();
        $trip = Trip::first();
        $bus = Bus::first();
        $seat = $bus->seats->first();

        // Create trip schedule
        $schedule = TripSchedule::create([
            'trip_id' => $trip->id,
            'travel_date' => now()->addDay(),
            'departure_time' => '08:00',
            'arrival_time' => '14:00'
        ]);

        // Assign bus to trip
        TripBusAssignment::create([
            'trip_schedule_id' => $schedule->id,
            'bus_id' => $bus->id
        ]);

        $response = $this->actingAs($user, 'sanctum')
            ->postJson('/api/book-seat', [
                'trip_schedule_id' => $schedule->id,
                'seat_id' => $seat->id,
                'start_city_id' => $cairo->id,
                'end_city_id' => $asyut->id
            ]);

        $response->assertStatus(201)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'booking_reference',
                    'price'
                ]
            ]);
    }

    public function test_validation_errors_for_invalid_data()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user, 'sanctum')
            ->postJson('/api/book-seat', [
                'trip_schedule_id' => 999999, // Invalid ID
                'seat_id' => 999999, // Invalid ID
                'start_city_id' => 999999, // Invalid ID
                'end_city_id' => 999999 // Invalid ID
            ]);

        $response->assertStatus(422)
            ->assertJsonStructure([
                'message',
                'errors' => [
                    'trip_schedule_id',
                    'seat_id',
                    'start_city_id',
                    'end_city_id'
                ]
            ]);
    }
}
