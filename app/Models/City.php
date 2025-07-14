<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class City extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'code'];

    public function startTrips()
    {
        return $this->hasMany(Trip::class, 'start_city_id');
    }

    public function endTrips()
    {
        return $this->hasMany(Trip::class, 'end_city_id');
    }

    public function startBookings()
    {
        return $this->hasMany(Booking::class, 'start_city_id');
    }

    public function endBookings()
    {
        return $this->hasMany(Booking::class, 'end_city_id');
    }
}
