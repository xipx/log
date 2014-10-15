This is a tiny library which provide your a more easier way for logging. It's a wrapper function of the original `console.log()`.
Read 'Usage' section for more details.


##Features

* Easy to write
* Enable and disable on demand
* Set a color or style for logging


##Usage


```javascript
//turn on log
log.enable();

//the good old log
log('start');

//colored log
log('start', 'red');

//colored log + l(large size)
log('start', 'red-l');

//colored log + xl(x-large size)
log('start', 'green-xl');

//styled log
log('start', 'warn');

//add a custom color
log.set('color', {myColor: '#2B3D4D'});
log('start', 'myColor');

//add a custom style
log.set('style', {myStyle: 'background-color:yellow; text-decoration: underline; color:red;'});
log('start', 'myStyle');

//subsequent `log()` won't work
log.disable();
log('end');
```
And the logs look like this.

![screenshot](https://raw.githubusercontent.com/xipx/log/master/screeshot.png)
