<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TripSchedule extends Model
{
    use HasFactory;

    protected $fillable = [
        'trip_id',
        'travel_date',
        'departure_time',
        'arrival_time',
        'is_active'
    ];

    protected $casts = [
        'travel_date' => 'date',
        'departure_time' => 'datetime:H:i',
        'arrival_time' => 'datetime:H:i',
        'is_active' => 'boolean'
    ];

    public function trip()
    {
        return $this->belongsTo(Trip::class);
    }

    public function busAssignment()
    {
        return $this->hasOne(TripBusAssignment::class);
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }

    public function getBus()
    {
        return $this->busAssignment?->bus;
    }
}
