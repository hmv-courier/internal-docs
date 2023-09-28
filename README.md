

## HMV Courier Database Documentation

### Table of Contents

1. [Introduction](#introduction)
2. [Database Structure](#database-structure)
3. [Table Descriptions](#table-descriptions)
4. [Sample Queries](#sample-queries)

### 1. Introduction <a name="introduction"></a>

This documentation provides an overview of the HMV Courier database structure and guidelines on how to use it. The database contains tables for managing users, deliveries, business transactions, and rider locations.

### 2. Database Structure <a name="database-structure"></a>



The HMV Courier database consists of the following tables:
Also this is the sql code you put into the sql writer 
can be downloaded on the repository
at
<a href="https://github.com/hmv-courier/internal-docs/blob/main/hmv-courier%20(1).sql">Sql code</a>

#### 2.1 `admin_user`

- This table stores information about admin users.
- Fields:
  - `id`: Unique identifier for the admin user.
  - `name`: Name of the admin user.
  - `mail`: Email address of the admin user.
  - `phone`: Phone number of the admin user.
  - `password`: Password for the admin user.

#### 2.2 `business_user`

- This table stores information about business users.
- Fields:
  - `id`: Unique identifier for the business user.
  - `name`: Name of the business user.
  - `company_name`: Name of the company associated with the business user.
  - `mail`: Email address of the business user.
  - `phone`: Phone number of the business user.
  - `country`: Country information.
  - `password`: Password for the business user.
  - `date`: Date information.
  - `reg_date`: Registration date and time.

#### 2.3 `business_wallet`

- This table stores information about business wallets.
- Fields:
  - `id`: Unique identifier for the wallet.
  - `b_id`: Identifier for the associated business.
  - `type`: Type of wallet.
  - `amount`: Amount in the wallet.

#### 2.4 `b_balance`

- This table stores balance information for business users.
- Fields:
  - `id`: Unique identifier for the balance record.
  - `b_id`: Identifier for the associated business.
  - `balance`: Balance amount.

#### 2.5 `deliveries`

- This table stores information about deliveries.
- Fields:
  - `id`: Unique identifier for the delivery.
  - `user_id`: Identifier for the user making the delivery request.
  - `rider_id`: Identifier for the assigned rider.
  - `pickup_address`: Pickup address for the delivery.
  - `pickup_date`: Pickup date and time.
  - `pickup_person_name`: Name of the pickup person.
  - `pickup_phone`: Phone number for pickup.
  - `pickup_latitude`: Latitude coordinate for pickup location.
  - `pickup_longitude`: Longitude coordinate for pickup location.
  - `dropoff_address`: Dropoff address for the delivery.
  - `dropoff_date`: Dropoff date and time.
  - `dropoff_person_name`: Name of the dropoff person.
  - `dropoff_phone`: Phone number for dropoff.
  - `dropoff_latitude`: Latitude coordinate for dropoff location.
  - `dropoff_longitude`: Longitude coordinate for dropoff location.
  - `order_status`: Status of the delivery order.
  - `note`: Additional notes for the delivery.
  - `creation_date`: Date and time of order creation.
  - `price`: Price information for the delivery.

#### 2.6 `rider_locations`

- This table stores location information for riders.
- Fields:
  - `id`: Unique identifier for the location record.
  - `rider_id`: Identifier for the rider.
  - `latitude`: Latitude coordinate of the rider's location.
  - `longitude`: Longitude coordinate of the rider's location.
  - `timestamp`: Timestamp of the location update.

#### 2.7 `rider_order_locations`

- This table stores location information for riders associated with specific delivery orders.
- Fields:
  - `id`: Unique identifier for the location record.
  - `rider_id`: Identifier for the rider.
  - `order_id`: Identifier for the associated delivery order.
  - `latitude`: Latitude coordinate of the location.
  - `longitude`: Longitude coordinate of the location.
  - `timestamp`: Timestamp of the location update.

#### 2.8 `user`

- This table stores information about regular users.
- Fields:
  - `id`: Unique identifier for the user.
  - `name`: Name of the user.
  - `mail`: Email address of the user.
  - `phone`: Phone number of the user.
  - `country`: Country information.
  - `password`: Password for the user.
  - `date`: Date information.
  - `reg_date`: Registration date and time.

#### 2.9 `user_rider`

- This table stores information about user-rider relationships.
- Fields:
  - `id`: Unique identifier for the relationship record.
  - `name`: Name of the user-rider relationship.
  - `mail`: Email address associated with the relationship.
  - `phone`: Phone number associated with the relationship.
  - `operator`: Operator information.
  - `country`: Country information.
  - `password`: Password for the relationship.
  - `date`: Date information.
  - `reg_date`: Registration date and time.

### 3. Table Descriptions <a name="table-descriptions"></a>

For detailed information on each table's columns, data types, and constraints, please refer to the database structure section above.

### 4. Sample Queries <a name="sample-queries"></a>

Here are some sample SQL queries that demonstrate how to interact with the HMV Courier database:

#### 4.1 Select all deliveries for a specific user:

```sql
SELECT * FROM deliveries WHERE user_id = 1;
```

#### 4.2 Update the order status for a delivery:

```sql
UPDATE deliveries SET order_status = 2 WHERE id = 3;
```

#### 4.3 Retrieve the balance for a specific business user:

```sql
SELECT balance FROM b_balance WHERE b_id = '383086J';
```

#### 4.4 Insert a new rider location record:

```sql
INSERT INTO rider_locations (rider_id, latitude, longitude) VALUES (1, '6.562901', '3.368013');
```

These are just a few examples of how you can use the database tables and perform common operations. Please refer to the specific needs of your application for more advanced queries and operations.

### Conclusion

This documentation provides an overview of the HMV Courier database structure and basic usage guidelines. Developers can use this information to build and maintain applications that interact with the database.
# Application Login System Documentation

This documentation explains how the login system of your application works. The login system is implemented in PHP and is designed for user authentication. The system checks user credentials, such as email and password, against a database and grants access if the provided information is correct. Below is an overview of how the login system functions:

## Table of Contents
1. **Authentication Flow**
2. **Cookie-Based Persistent Login**
3. **Password Encryption**
4. **User Interface**

---

### 1. Authentication Flow

The login system follows a straightforward authentication flow:

1. When a user visits the login page, they are presented with a form that asks for their email and password.
2. The user enters their credentials and submits the form.
3. The PHP script processes the submitted data.
4. It queries the database to check if the provided email and password match any user records.
5. If a match is found, the user is considered authenticated, and they are redirected to the home page.
6. If there is no match or an error occurs, the user is presented with an error message.

### 2. Cookie-Based Persistent Login

The system includes a cookie-based persistent login feature, which allows users to stay logged in across multiple sessions. Here's how it works:

- If a user successfully logs in, a cookie named `included for all logins` is set in their browser with the user's unique identifier (e.g., user ID).
- This cookie has an expiration time, ensuring that the user remains logged in for a certain duration (e.g., 380 days).
- Whenever a user visits the site again, the system checks for the presence of this cookie.
- If the cookie is found and valid, the user is automatically logged in without having to re-enter their credentials.
- This enhances user convenience and provides a seamless experience.

### 3. Password Encryption

For security reasons, the user's password is encrypted before being stored in the database and when comparing it during login. The following encryption steps are applied to the password:

1. The user enters their password in the login form.
2. The PHP script applies multiple levels of encryption to the password:
   - MD5 hashing
   - SHA1 hashing
   - Another layer of SHA1 hashing
   - Final MD5 hashing
3. The result of these encryption steps is compared to the encrypted password stored in the database.

This multi-layered encryption approach adds an extra layer of security to user passwords.

### 4. User Interface

The login system is integrated into a user-friendly interface. Here are some notable features of the user interface:

- The user is prompted to enter their email and password.
- If login fails (due to incorrect credentials or other errors), an error message is displayed.
- A "Sign in with Google" option is provided for users who prefer third-party authentication (But not yet implemented).
- Styling is applied to make the login form visually appealing, with Bootstrap CSS used for the design.
- Users can sign out or log out of their accounts as needed.

Please note that the actual form inputs and HTML structure are not included in this documentation but can be seen in the provided PHP code.

This documentation provides an overview of how the login system functions in your application. It covers the authentication flow, cookie-based persistent login, password encryption, and aspects of the user interface. You can customize and expand upon this foundation to suit the specific requirements of your project.

# Rider Section Documentation

The rider section of the developer homepage is responsible for managing tasks and pickups for delivery riders. This documentation will provide an overview of how this section works, its key features, and its code structure.

## Table of Contents
1. **Authentication**
2. **Task Retrieval and Display**
3. **Task Acceptance**
4. **Greeting Based on Time**
5. **User Interface**

---

### 1. Authentication

Before a rider can access the rider section, authentication is performed to ensure they are a valid and logged-in user. Authentication is based on the presence of a cookie named `userid_rider`, which contains the rider's unique identifier (ID). The code checks if this cookie exists and retrieves the rider's data from the database. If authentication fails, the rider is redirected to the logout page.

### 2. Task Retrieval and Display

The rider section fetches tasks that are available for pickup and display them. The relevant SQL query retrieves tasks where the `rider_id` is not assigned (equal to 0) and the `order_status` is 0 (indicating the task is waiting for a rider to pick up). These tasks are displayed in a card-based format, showing various details about each task, such as pickup and drop-off information.

### 3. Task Acceptance

Riders can accept tasks by clicking the "Accept Task" button associated with each task card. When a task is accepted, the code updates the task in the database by assigning the rider's ID and changing the `order_status` to 1 (indicating the task is in progress). After accepting the task, the rider is redirected to the map page (`map.php`) for further navigation and delivery.

### 4. Greeting Based on Time

A dynamic greeting message is displayed to the rider based on the current time of day. The code calculates the current hour, and based on that, it selects an appropriate greeting message, such as "Good Morning," "Good Afternoon," "Good Evening," or "Good Night." This feature adds a personalized touch to the rider's experience.

### 5. User Interface

The user interface of the rider section is designed to be user-friendly and visually appealing. It includes Bootstrap CSS for styling and responsiveness. Key components of the user interface include:

- A personalized greeting message.
- Task cards displaying relevant task details.
- Buttons to accept tasks.
- A navigation bar (included via `header.php`) for easy navigation.

The user interface provides a clear and intuitive way for riders to view and accept tasks.

This documentation provides an overview of how the rider section of the developer homepage works. It covers authentication, task retrieval and display, task acceptance, dynamic greetings, and user interface elements. Developers can further customize and expand upon this code to meet the specific requirements of their delivery application.
# Rider Location Tracking Documentation

The Rider Location Tracking script enables your delivery application to continuously track and update the current location of delivery riders. This documentation provides an overview of how this script works, its key features, and its code structure.

## Table of Contents
1. **Receiving Rider Location Data**
2. **Authentication and User Identification**
3. **Database Interaction**
4. **Location Record Update**
5. **Response Handling**
6. **Error Handling**

---

### 1. Receiving Rider Location Data

The script is designed to receive location data from riders using a POST request. The rider's latitude and longitude coordinates are expected to be sent as part of the POST request payload.

### 2. Authentication and User Identification

To ensure that location data is associated with the correct rider, the script performs user authentication. It checks if the rider is logged in by verifying the presence of a specific cookie (`userid_rider`) that contains the rider's unique identifier (ID). Adjust the authentication logic according to your application's authentication mechanism.

### 3. Database Interaction

The script interacts with a database to store and update rider location data. It performs the following actions:

- Checks if a record for the rider already exists in the `rider_locations` table by querying the database.
- If a record exists, it updates the existing record with the new latitude and longitude coordinates.
- If no record exists, it creates a new record for the rider in the `rider_locations` table.

### 4. Location Record Update

The script updates the location records in the database with the rider's latest coordinates. This allows your application to keep track of the rider's real-time location, which can be useful for various purposes, such as order tracking or displaying the rider's location on a map.

### 5. Response Handling

The script provides responses to inform the sender (the rider's device or application) about the status of the location update operation. It echoes different messages based on the outcome of the database interaction, such as "Location updated successfully" or "Failed to update location."

### 6. Error Handling

The script includes error handling to deal with various scenarios, such as:

- Authentication failure (user not logged in).
- Missing latitude or longitude in the POST request.
- Invalid request method (only POST requests are accepted).
- Database update or insertion failures.

By handling errors gracefully and providing informative messages, you can ensure a robust and reliable location tracking system.

This documentation provides an overview of how the Rider Location Tracking script works. It covers receiving location data, user authentication, database interaction, location record updates, response handling, and error handling. Developers can integrate and customize this script to enable real-time location tracking for delivery riders in their application.

# Rider Location and Task Status Tracking Documentation

The Rider Location and Task Status Tracking page is designed to assist riders in navigating to their delivery locations, view task status, and perform specific actions related to their tasks. This documentation explains how this page works and provides information about its key features.

## Table of Contents
1. **Authentication and Rider Identification**
2. **Task and Location Data Retrieval**
3. **Task Status Control**
4. **Real-time Location Tracking**
5. **Map Integration**
6. **Action Buttons**
7. **Error Handling**

---

### 1. Authentication and Rider Identification

This page starts by checking if the rider is authenticated and identified. It verifies the presence of a specific cookie (`userid_rider`) that contains the rider's unique identifier (ID). If the rider is not authenticated, the page redirects them to the logout page.

### 2. Task and Location Data Retrieval

Based on the `taskid` parameter provided in the URL, the page retrieves task-specific information, including the pickup and drop-off addresses and the current task status. This data is essential for providing accurate directions and task status updates.

### 3. Task Status Control

The page allows riders to control the status of their tasks. Depending on the current task status, riders can:

- Complete the task
- Halt the task (pause)
- Resume a halted task

The rider's ability to perform these actions is context-sensitive and depends on the current task status. For example, a rider can complete a task if it is currently in progress, but they can only halt or resume it if it is not completed.

### 4. Real-time Location Tracking

The page includes real-time location tracking for the rider. The rider's location is updated continuously and sent to the server at regular intervals (every 200 milliseconds). This ensures that the rider's location is up-to-date and can be used for various purposes, such as displaying the rider's position on the map.

### 5. Map Integration

The page integrates Google Maps to provide riders with directions to the delivery locations. It calculates turn-by-turn directions from the rider's current location to the pickup and drop-off addresses. The map displays a 3D view with a north-facing perspective, improving navigation (But we do not know why these features are not working).

### 6. Action Buttons

The page includes action buttons that allow riders to interact with their tasks and update their status. These buttons include:

- Complete: Marks the task as completed.
- Halt: Pauses the task temporarily.
- Resume: Resumes a previously halted task.
- Home: Navigates the rider back to the home page.

The availability of these buttons depends on the current task status and ensures efficient task management.

### 7. Error Handling

The page includes error handling to manage various scenarios, such as:

- Missing or invalid `taskid` parameter.
- Authentication failure (user not logged in).
- Issues with updating the task status or rider's location.
- Problems with retrieving task and location data.

By handling errors gracefully and providing informative messages, the page ensures a smooth and reliable experience for the rider.

This documentation provides an overview of the Rider Location and Task Status Tracking page's functionality. It covers authentication, task and location data retrieval, task status control, real-time location tracking, map integration, action buttons, and error handling. Developers can integrate and customize this page to enhance the rider's experience in their delivery application.

# Customer Create Order Page Documentation

The Customer Create Order Page allows customers to create new delivery orders by providing specific details such as pickup and drop-off locations, contact information, dates, and additional notes. This documentation explains how this page works and provides information about its key features.

## Table of Contents
1. **Authentication and Customer Identification**
2. **Form Fields**
    - Pickup Address
    - Pickup Person's Name and Phone
    - Pickup Date
    - Drop-off Address
    - Drop-off Person's Name and Phone
    - Drop-off Date
    - Additional Notes
3. **Geolocation Integration**
    - Pickup Address Autocomplete
    - Drop-off Address Autocomplete
4. **Submitting the Order**
5. **Error Handling**

---

### 1. Authentication and Customer Identification

This page begins by checking if the customer is authenticated and identified. It verifies the presence of a specific cookie (`userid`) that contains the customer's unique identifier (ID). If the customer is not authenticated, the page redirects them to the logout page.

### 2. Form Fields

The page includes a form that customers can fill out to create a new delivery order. Below are the key form fields:

#### Pickup Address

Customers enter the address from where the item needs to be picked up. As the customer starts typing, the field offers address suggestions using Google Places Autocomplete for accurate address selection.

#### Pickup Person's Name and Phone

Customers provide the name and phone number of the person responsible for handing over the item at the pickup location.

#### Pickup Date

Customers specify the date when the item will be ready for pickup.

#### Drop-off Address

Customers enter the address to which the item should be delivered. Similar to the pickup address, this field also offers address suggestions through Google Places Autocomplete.

#### Drop-off Person's Name and Phone

Customers provide the name and phone number of the person who will receive the item at the drop-off location.

#### Drop-off Date

Customers specify the date when the item should be delivered to the drop-off location.

#### Additional Notes

Customers can include any relevant additional notes or instructions related to the delivery.

### 3. Geolocation Integration

The page integrates Google Places Autocomplete for both pickup and drop-off address fields to help customers accurately select locations. When customers start typing, the Autocomplete feature suggests valid addresses.

#### Pickup Address Autocomplete

The Autocomplete feature is applied to the pickup address field (`pickupAddress`). When customers select an address suggestion, the latitude and longitude of that address are automatically filled in hidden fields (`pickupLatitude` and `pickupLongitude`).

#### Drop-off Address Autocomplete

The Autocomplete feature is also applied to the drop-off address field (`dropoffAddress`). Similar to the pickup address, the latitude and longitude of the selected address are filled in hidden fields (`dropoffLatitude` and `dropoffLongitude`).

### 4. Submitting the Order

After customers have filled out the necessary details, they can click the "Proceed To Pay" button to submit the order. The form data is sent to the "pay.php" script for further processing and payment.

### 5. Error Handling

The page includes error handling to manage various scenarios, such as:

- Missing or invalid authentication (user not logged in).
- Issues with form field validation or data submission.
- Problems with Google Places Autocomplete integration.

By handling errors gracefully and providing informative messages, the page ensures a smooth and user-friendly order creation process for customers.

This documentation provides an overview of the Customer Create Order Page's functionality. It covers authentication, form fields for order details, Google Places Autocomplete integration, order submission, and error handling. Developers can customize and integrate this page into their delivery application to allow customers to create new orders efficiently.
# Customer Payment Page Documentation

The Customer Payment Page (`pay.php`) allows customers to pay for their delivery orders. This documentation explains how this page works and provides information about its key features.

## Table of Contents
1. **Authentication and Customer Identification**
2. **Calculating Distance and Price**
3. **Payment Integration**
    - JavaScript Setup
    - Payment Processing
4. **Redirecting to Success Page**
5. **Error Handling**

---

### 1. Authentication and Customer Identification

The page begins by checking if the customer is authenticated and identified. It verifies the presence of a specific cookie (`userid`) that contains the customer's unique identifier (ID). If the customer is not authenticated, the page redirects them to the logout page.

### 2. Calculating Distance and Price

The page includes a function (`calculateDistance`) to calculate the distance between the pickup and drop-off locations using their latitude and longitude coordinates. The distance calculation is based on the Haversine formula and is used to determine the delivery price.

The price calculation logic is defined based on the calculated distance. In this example, a constant `pricePerKilometer` is used to determine the price per kilometer. Adjust this value according to your pricing model. The calculated price is stored in a cookie (`price`) for later use.

### 3. Payment Integration

The page integrates with the Paystack payment gateway to process payments. Here's how the payment integration works:

#### JavaScript Setup

- The Paystack JavaScript library (`https://js.paystack.co/v1/inline.js`) is included in the page's `<script>` tags.
- An event listener is added to the "Paystack" button (`payButton`) to trigger payment processing when clicked.

#### Payment Processing

- When the "Paystack" button is clicked, the `PaystackPop.setup` function is called with the following parameters:
    - `key`: Your Paystack public key.
    - `email`: The customer's email address.
    - `amount`: The payment amount in kobo (100 kobo = 1 Naira).
    - `currency`: The currency code (e.g., 'NGN' for Nigerian Naira).
    - `ref`: A unique reference for the payment (e.g., 'HMVCOURIER-' followed by a random number).
    - `callback`: A callback function to handle payment success. It redirects to a success page.
    - `onClose`: A function to handle the closure of the payment modal.

- The payment modal is opened using `handler.openIframe()`.

### 4. Redirecting to Success Page

After a successful payment, the customer is redirected to a success page (`success.php`). You can pass payment details to the success page if needed. The `redirectToSuccessPage` JavaScript function is responsible for this redirection.

### 5. Error Handling

The page includes error handling to manage various scenarios, such as:

- Missing or invalid authentication (user not logged in).
- Issues with payment processing, including payment cancellation or closure.

By handling errors gracefully and providing informative messages, the page ensures a smooth payment process for customers.

This documentation provides an overview of the Customer Payment Page's functionality. It covers authentication, distance and price calculation, Paystack payment integration, payment processing, redirection to a success page, and error handling. Developers can customize and integrate this page into their delivery application to facilitate secure and convenient payments for customers.
# Customer Payment Success Page Documentation

The Customer Payment Success Page (`success.php`) provides feedback to customers after a successful payment and handles the storage of order details in a database. This documentation explains how this page works and provides information about its key features.

## Table of Contents
1. **Authentication and Customer Identification**
2. **Retrieving Cookie Data**
3. **Database Insertion**
4. **Displaying Payment Success Message**
5. **Cookie Deletion**
6. **Error Handling**

---

### 1. Authentication and Customer Identification

The page begins by checking if the customer is authenticated and identified. It verifies the presence of a specific cookie (`userid`) that contains the customer's unique identifier (ID). If the customer is not authenticated, the page redirects them to the logout page.

### 2. Retrieving Cookie Data

The page retrieves important order-related information from cookies. A list of required cookie names is defined, and a loop is used to retrieve their values. These cookies were previously set on the customer order page (`pay.php`) and contain data such as pickup and drop-off details, price, and notes.

### 3. Database Insertion

The retrieved cookie data is used to construct an SQL query to insert the order details into a database table named `deliveries`. The query includes the customer's ID, pickup and drop-off information, order status, notes, and price. If the insertion is successful, a success message is displayed. Otherwise, an error message is displayed.

### 4. Displaying Payment Success Message

A Bootstrap modal is used to display a payment success message. The modal appears when the payment is successful and informs the customer that they will be redirected to a tasks page. The modal is styled using Bootstrap CSS classes.

### 5. Cookie Deletion

After displaying the success or error message and waiting for a few seconds, JavaScript is used to delete the cookies related to the order. This ensures that the order data is cleared from the customer's browser for security and privacy reasons.

### 6. Error Handling

The page includes error handling to manage scenarios such as:

- Missing or invalid authentication (user not logged in).
- Issues with database insertion.
- Missing or incomplete order data cookies.

By handling errors gracefully and providing informative messages, the page ensures a smooth experience for customers, even in the case of errors.

This documentation provides an overview of the Customer Payment Success Page's functionality. It covers authentication, retrieval of cookie data, database insertion, display of payment success message, cookie deletion, and error handling. Developers can customize and integrate this page into their delivery application to provide a seamless payment experience for customers.

# Customer Track Rider Page Documentation

The Customer Track Rider Page (`track_task.php`) allows customers to track the real-time location of their delivery rider on a map. This documentation explains how this page works and provides information about its key features.

## Table of Contents
1. **Authentication and Customer Identification**
2. **Retrieving Task Details**
3. **Google Maps Integration**
4. **Rider Location Updates**
5. **Page Layout**

---

### 1. Authentication and Customer Identification

The page begins by checking if the customer is authenticated and identified. It verifies the presence of a specific cookie (`userid`) that contains the customer's unique identifier (ID). If the customer is not authenticated, the page redirects them to the logout page.

### 2. Retrieving Task Details

If the `id` parameter is present in the URL (e.g., `track_task.php?id=123`), it retrieves the task ID from the URL and fetches task details from the database, including pickup and drop-off addresses.

### 3. Google Maps Integration

The page integrates Google Maps to display the route between the pickup and drop-off locations and the real-time location of the rider. Key components of Google Maps integration include:

- **Map Initialization:** The `initMap` function initializes the map, sets its center, and creates markers for the pickup, drop-off, and rider locations.

- **Directions Display:** The page uses the Google Maps Directions Service to calculate and display turn-by-turn directions from the pickup to the drop-off location. The directions are displayed in a separate panel on the page.

- **Rider Location Marker:** A marker is created to represent the rider's location on the map. For demonstration purposes, this marker is initially placed at the rider's last known location. In a real application, this location would be updated based on real-time data from the rider's device.

### 4. Rider Location Updates

A timer is set up to periodically update the rider's location on the map. In a real application, this would involve continuously fetching the rider's location from a database or a real-time tracking service. For demonstration purposes, the rider's marker is updated randomly.

### 5. Page Layout

The page layout includes a map container (`<div id="map"></div>`) to display the map and a panel (`<div id="directions-panel">`) to display turn-by-turn directions. The Bootstrap framework is used for styling and responsiveness.

This documentation provides an overview of the Customer Track Rider Page's functionality. It covers authentication, retrieval of task details, Google Maps integration for displaying directions and rider location, rider location updates, and page layout. Developers can customize and integrate this page into their delivery application to provide customers with a convenient way to track their deliveries in real time.