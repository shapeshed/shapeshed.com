{
  "layout": "post",
  "slug": "html5-geolocation-api",
  "title": "The HTML5 Geolocation API",
  "date": "2014-01-07T20:30:56+00:00",
  "description": "The HTML5 Geolocation API allows you to request geolocation data including longitude, latitude, altitude, speed and direction of travel.",
  "tags": [
    "HTML",
    "JavaScript"
  ]
}

The HTML5 Geolocation API is now widely supported and can be used across a range of mobile and desktop browsers. It is even supported from IE9 up in Internet Explorer. It allows you to request the geolocation of a user's browser including altitude, speed and direction of travel.

## Basic usage

This allows you to get a single location. Note that the browser will ask the user for permission to provide geolocation data.

![Brower requesting access to geolocation][5]

    var geoSuccessHandler = function (position) { 
      console.log(position);
    };

    navigator.geolocation.getCurrentPosition(geoSuccessHandler);

This returns a `Position` object with longitude, latitude and more.

    { 
      timestamp:1389094994694,
      coords: {
        speed: null,
        heading: null,
        altitudeAccuracy: null,
        accuracy:122000,
        altitude:null,
        longitude:-3.60512,
        latitude:55.070859
      }
    }

The [spec][1] outlines what these fields mean

> The latitude and longitude attributes are geographic coordinates specified in decimal degrees.
>
> The altitude attribute denotes the height of the position, specified in meters above the [WGS84] ellipsoid. If the implementation cannot provide altitude information, the value of this attribute must be null.
> 
> The accuracy attribute denotes the accuracy level of the latitude and longitude coordinates. It is specified in meters and must be supported by all implementations. The value of the accuracy attribute must be a non-negative real number.
>
> The altitudeAccuracy attribute is specified in meters. If the implementation cannot provide altitude information, the value of this attribute must be null. Otherwise, the value of the altitudeAccuracy attribute must be a non-negative real number.
>
> The accuracy and altitudeAccuracy values returned by an implementation should correspond to a 95% confidence level.
>
> The heading attribute denotes the direction of travel of the hosting device and is specified in degrees, where 0° ≤ heading < 360°, counting clockwise relative to the true north. If the implementation cannot provide heading information, the value of this attribute must be null. If the hosting device is stationary (i.e. the value of the speed attribute is 0), then the value of the heading attribute must be NaN.
>
> The speed attribute denotes the magnitude of the horizontal component of the hosting device's current velocity and is specified in meters per second. If the implementation cannot provide speed information, the value of this attribute must be null. Otherwise, the value of the speed attribute must be a non-negative real number.

## Watching a location

You watch a location as follows. Each time the device location is updated the success handler will be called.

    var geoSuccessHandler = function (position) { 
      console.log(position);
    };

    var watchLocation = navigator.geolocation.watchPosition(geoSuccessHandler);

To stop watching a location use `clearWatch`.

    navigator.geolocation.clearWatch(watchLocation);

## Error handling

The geolocation methods support passing a second function to be called when there is an error. This will pass a `PositionError` object to the function.

    var geoSuccessHandler = function (position) { 
      console.log(position); 
    };

    var geoErrorHandler = function (error) { 
      console.log(error); 
    };

    navigator.geolocation.getCurrentPosition(geoSuccessHandler, geoErrorHandler);

If the user denies access to geolocation the `PositionError` object looks like this.

    { 
      message: "User denied Geolocation", 
      code: 1, 
    }

The code number maps to the following scenarios:

* PERMISSION_DENIED: 1 - The user chose to deny access to geolocation.
* POSITION_UNAVAILABLE: 2 - It wasn't possible to get a location.
* TIMEOUT: 3 - It took too long to get the user's location.

## More options

You can pass a third argument to `getCurrentPosition()` and `watchPosition()` that allows you to set some options.

* <strong>enableHighAccuracy</strong> (boolean) - this requests the most accurate location which may mean it takes longer or uses more battery. This defaults to false.
* <strong>timeout</strong> (number) - This represents the amount of time before the browser considers the geolocation request to have timed out. If this is trigger the error handler will get a code of 3. The default value for this is Infinity.
* <strong>maximumAge</strong> (number) - This allows the browser to return a cached location if the cache is not greater than the time given in milliseconds. So if you specify 0 you want a fresh value. If you specify Infinity you get a cached value. The default value is 0.

A full example with `PositionOptions` specified looks like this

    var geoSuccessHandler = function (position) { 
      console.log(position); 
    };

    var geoErrorHandler = function (error) { 
      console.log(error);
    };

    var positionOptions = {
      enableHighAccuracy: true,
      timeout: 1000,
      maximumAge: 500
    };

    navigator.geolocation.getCurrentPosition(geoSuccessHandler, geoErrorHandler, positionOptions);

## Browser support

For the latest browser support please consult [caniuse.com][4]

## References 

* [W3C Geolocation API][1]
* [HTML5 Geolocation Demo][2]
* [Dive Into HTML5 Geolocation][3]
* [Geolocation Browser Support][4]

[1]: http://www.w3.org/TR/geolocation-API/
[2]: http://html5demos.com/geo
[3]: http://diveintohtml5.info/geolocation.html
[4]: http://caniuse.com/#feat=geolocation
[5]: http://shapeshed.com/images/articles/geolocation-permission.png
