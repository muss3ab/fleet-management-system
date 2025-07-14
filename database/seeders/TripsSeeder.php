<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\City;
use App\Models\Trip;

class TripsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $cities = City::all()->keyBy('code');

        $trips = [
            [
                'name' => 'Cairo to Asyut Express',
                'route' => [
                    $cities['CAI']->id,
                    $cities['FAY']->id,
                    $cities['MIN']->id,
                    $cities['ASY']->id
                ],
                'base_price' => 50.00,
                'departure_time' => '08:00',
                'arrival_time' => '14:00'
            ],
            [
                'name' => 'Cairo to Luxor Deluxe',
                'route' => [
                    $cities['CAI']->id,
                    $cities['FAY']->id,
                    $cities['MIN']->id,
                    $cities['ASY']->id,
                    $cities['SOH']->id,
                    $cities['LUX']->id
                ],
                'base_price' => 40.00,
                'departure_time' => '10:00',
                'arrival_time' => '18:00'
            ],
            [
                'name' => 'Giza to AlMinya Direct',
                'route' => [
                    $cities['GIZ']->id,
                    $cities['FAY']->id,
                    $cities['MIN']->id
                ],
                'base_price' => 60.00,
                'departure_time' => '12:00',
                'arrival_time' => '16:00'
            ]
        ];

        foreach ($trips as $tripData) {
            Trip::create($tripData);
        }
    }
}
