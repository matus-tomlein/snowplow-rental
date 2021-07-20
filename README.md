# Snowplow Rental

This is a simple demo app that shows the integration of a Ruby on Rails app with the Snowplow Analytics micro instance.

The app provides an interface for making reservations for three snowplows.
The reservations are validated to make sure they contain the required information, are long enough, are not in the past, and do not overlap with other reservations.

Events from the browser and also server events are tracked in Snowplow Analytics.
These include page view events both from the client and server, form tracking events from the client, and create, update and delete actions on reservations from the server.
Server tracked events and actions are enhanced with additional context including the snowplow and reservation models that are relevant for the events.

You can see a demo of the app and tracked events in Snowplow Micro in this short video: https://youtu.be/VrUGobWPa7Q

## Tracker Snowplow Analytics events

There are trackers both client and server side that track the following actions and events:

* Javascript tracker
  * Tracks automatically generated events such as page views, and form tracking
* Ruby tracker
  * Sends page view events along with additional context – for snowplow pages, a self-describing JSON containing the snowplow details is sent and for reservation pages both self-describing JSONs for snowplow and reservation are added
  * Sends structured events for CRUD reservation actions along with self-describing JSON context for the relevant snowplow and reservation

Both Javascript and Ruby trackers share the domain user IDs for tracked events. I used the [snowplow_ruby_duid gem](https://github.com/simplybusiness/snowplow_ruby_duid).

Iglu schemas for the contextual objects are hosted here on Github.
The following two models are described:

* Snowplow model schema: https://raw.githubusercontent.com/matus-tomlein/snowplow-rental/main/iglu/schemas/test.example.iglu/snowplow/jsonschema/1-0-0
* Reservation model schema: https://raw.githubusercontent.com/matus-tomlein/snowplow-rental/main/iglu/schemas/test.example.iglu/reservation/jsonschema/1-0-0

## Installation and usage

The app uses Docker compose to set up both Snowplow Micro instance and the Rails app (including an SQLite database).
To set-up and start the app, simply run:

```
docker-compose up
```

This will start servers for the Rails app on port 3000 and the Micro instance on port 9090.
Navigate to localhost:3000 to use the app.

## Next steps and TODOs

* Add more automated tests
  * Automated system tests for checking that Snowplow events are getting to the Micro instance and are valid are missing
  * Some functionality like model validations are missing unit tests
* Publish more events to Snowplow
  * For instance validation errors could be interesting to send to Snowplow
* Improve configuration and continuous integration
  * Tests are not run automatically on deploy
  * Tests assume that a Snowplow Micro instance is running but do not instantiate it themselves on start
  * Snowplow Javascript tracker has a hardcoded address for the Micro instance on localhost since the request are not routed through the Rails container
