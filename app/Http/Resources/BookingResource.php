<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BookingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'booking_reference' => $this->booking_reference,
            'trip_name' => $this->tripSchedule->trip->name,
            'travel_date' => $this->tripSchedule->travel_date,
            'departure_time' => $this->tripSchedule->departure_time,
            'arrival_time' => $this->tripSchedule->arrival_time,
            'start_city' => $this->startCity->name,
            'end_city' => $this->endCity->name,
            'seat_number' => $this->busSeat->seat_number,
            'price' => $this->price,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
