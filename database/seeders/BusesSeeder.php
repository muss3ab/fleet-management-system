<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Bus;
use App\Models\BusSeat;

class BusesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $buses = [
            ['bus_number' => 'BUS001', 'model' => 'Mercedes Travego'],
            ['bus_number' => 'BUS002', 'model' => 'Volvo 9700'],
            ['bus_number' => 'BUS003', 'model' => 'Scania Touring'],
            ['bus_number' => 'BUS004', 'model' => 'MAN Lion\'s Coach'],
            ['bus_number' => 'BUS005', 'model' => 'Iveco Magelys']
        ];

        foreach ($buses as $busData) {
            $bus = Bus::create($busData);

            // Create 12 seats for each bus
            for ($i = 1; $i <= 12; $i++) {
                BusSeat::create([
                    'bus_id' => $bus->id,
                    'seat_number' => sprintf('%02d', $i)
                ]);
            }
        }
    }
}
