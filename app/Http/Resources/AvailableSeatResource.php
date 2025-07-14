<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AvailableSeatResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'trip_schedule_id' => $this->trip_schedule_id,
            'seat_id' => $this->seat_id,
            'seat_number' => $this->seat_number,
            'trip_name' => $this->trip_name,
            'departure_time' => $this->departure_time ? date('Y-m-d h:i A', strtotime($this->departure_time)) : null,
            'arrival_time' => $this->arrival_time ? date('Y-m-d h:i A', strtotime($this->arrival_time)) : null,
            'price' => $this->price
        ];
    }
}
