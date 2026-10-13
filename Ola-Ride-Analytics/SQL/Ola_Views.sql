use ola;

-- Q1. Retrieve all successful bookings:
create view successfull_bookings as 
select * from Bookings
where Booking_Status = 'Success';

-- Q2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as 
select Vehicle_Type, avg(Ride_Distance) 
as avg_distance from Bookings
group by Vehicle_Type;

-- Q3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) from bookings
where Booking_Status = 'Canceled by Customer';

-- Q4. List the top 5 customers who booked the highest number of rides:
create view top_5_customera as
select Customer_ID, count(booking_id) as total_rides
from bookings 
group by Customer_ID
order by total_rides desc limit 5;

-- Q5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_Drivers_P_C_Issues as 
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- Q6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create View Max_Min_Driver_Rating as
select Vehicle_Type, max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
FROM bookings
where Vehicle_Type = 'Prime Sedan';

-- Q7. Retrieve all rides where payment was made using UPI:
create view upi_payments as
select * from bookings
where Payment_Method = 'UPI';

-- Q8. Find the average customer rating per vehicle type:
create view avg_customer_rating as 
select Vehicle_Type, avg(Customer_Rating) as avg_rating
from bookings
group by Vehicle_Type;

-- Q9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(Booking_Value) as Total_Successful_Ride_Value
from bookings
where Booking_Status = 'Success';

-- Q10. List all incomplete rides along with the reason:
create view incomplete_rides_reason as
select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes'
