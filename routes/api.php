<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\AuthController;

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/available-seats', [BookingController::class, 'getAvailableSeats']);
    Route::post('/book-seat', [BookingController::class, 'bookSeat']);
    Route::get('/user-bookings', [BookingController::class, 'getUserBookings']);

    Route::post('/logout', [AuthController::class, 'logout']);
});
