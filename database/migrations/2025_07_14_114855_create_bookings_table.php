<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('trip_schedule_id')->constrained()->onDelete('cascade');
            $table->foreignId('bus_seat_id')->constrained()->onDelete('cascade');
            $table->foreignId('start_city_id')->constrained('cities')->onDelete('cascade');
            $table->foreignId('end_city_id')->constrained('cities')->onDelete('cascade');
            $table->decimal('price', 10, 2);
            $table->string('booking_reference')->unique();
            $table->enum('status', ['pending', 'confirmed', 'cancelled'])->default('pending');
            $table->timestamps();

            $table->unique(
                ['trip_schedule_id', 'bus_seat_id', 'start_city_id', 'end_city_id'],
                'booking_seat_city_unique'
            );
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
