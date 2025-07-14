<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Bus extends Model
{
    use HasFactory;

    protected $fillable = [
        'bus_number',
        'total_seats',
        'model',
        'is_active'
    ];

    protected $casts = [
        'is_active' => 'boolean'
    ];

    public function seats()
    {
        return $this->hasMany(BusSeat::class);
    }

    public function assignments()
    {
        return $this->hasMany(TripBusAssignment::class);
    }
}
