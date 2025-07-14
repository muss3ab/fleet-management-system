<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'trip_schedule_id',
        'bus_seat_id',
        'start_city_id',
        'end_city_id',
        'price',
        'booking_reference',
        'status'
    ];

    protected $casts = [
        'price' => 'decimal:2'
    ];


    protected static function boot()
    {
        parent::boot();

        static::creating(function ($booking) {
            $booking->booking_reference = 'BK' . strtoupper(uniqid());
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function tripSchedule()
    {
        return $this->belongsTo(TripSchedule::class);
    }

    public function busSeat()
    {
        return $this->belongsTo(BusSeat::class);
    }

    public function startCity()
    {
        return $this->belongsTo(City::class, 'start_city_id');
    }

    public function endCity()
    {
        return $this->belongsTo(City::class, 'end_city_id');
    }
}
