const EventEmitter = require("events");

const emitter = new EventEmitter();

// Example 1 — Create an Event Emitter Instance and Register a Couple of Callbacks

function c1() {
  console.log("callback function 1 called");
}

function c2() {
  console.log("callback function 2 called");
}

emitter.on("event1", c1);
emitter.on("event1", c2);
emitter.on("event1", () => {
  console.log("callback function 3 called");
});

emitter.emit("event1");

// Example 2 — Registering for the Event to Be Fired Only One Time Using Once

emitter.once("eventOnce", () => {
  console.log("this event can be called only once");
});
emitter.emit("eventOnce");
emitter.emit("eventOnce");
emitter.emit("eventOnce");

// Example 3 — Registering for the Event With Callback Parameters

emitter.on("status", (sts, code) => {
  console.log(`status is ${sts} and code is ${code}`);
});
emitter.emit("status", "ok", 200);

// Example 4 — Unregistering Events

emitter.off("event1", c1);
emitter.emit("event1");

//  Example 5 — Getting Listener Count

console.log(emitter.listenerCount("event1"));

// Example 6 — Getting Raw Listeners

console.log(emitter.rawListeners("event1"));

// Example 7 — Async Example Demo

class WithTime extends EventEmitter {
  execute(asyncFunc, ...args) {
    this.emit("begin");
    console.time("execute");
    this.on("data", (data) => console.log("got data ", data));
    asyncFunc(...args, (err, data) => {
      if (err) {
        return this.emit("error", err);
      }
      this.emit("data", data);
      console.timeEnd("execute");
      this.emit("end");
    });
  }
}

const withTime = new WithTime();

withTime.on("begin", () => console.log("About to execute"));
withTime.on("end", () => console.log("Done with execute"));

const readFile = (arg1, cb) => {
  console.log(arg1);
  cb(null, arg1);
};

withTime.execute(readFile, "argument1");

// creating own event emitter

class EventE {
    listeners = {}
    
    addListener(eventName, fn) {
      this.listeners[eventName] = this.listeners[eventName] || [];
      this.listeners[eventName].push(fn);
      return this;
    }
  
    on(eventName, fn) {
      return this.addListener(eventName, fn);
    }
  
    once(eventName, fn) {
      this.listeners[eventName] = this.listeners[eventName] || [];
      const onceWrapper = () => {
        fn();
        this.off(eventName, onceWrapper);
      }
      this.listeners[eventName].push(onceWrapper);
      return this;
    }
  
    off(eventName, fn) {
      return this.removeListener(eventName, fn);
    }
  
    removeListener (eventName, fn) {
      let lis = this.listeners[eventName];
      if (!lis) return this;
      for(let i = lis.length; i > 0; i--) {
        if (lis[i] === fn) {
          lis.splice(i,1);
          break;
        }
      }
      return this;
    }
  
    emit(eventName, ...args) {
      let fns = this.listeners[eventName];
      if (!fns) return false;
      fns.forEach((f) => {
        f(...args);
      });
      return true;
    }
  
    listenerCount(eventName) {
      let fns = this.listeners[eventName] || [];
      return fns.length;
    }
  
    rawListeners(eventName) {
      return this.listeners[eventName];
    }
  }


  const ee = new EventE();

  ee.on('event1',c1)
  ee.emit('event1');
  console.log(ee.rawListeners('event1'));
  console.log(ee.listenerCount('event1'));

  console.log(ee.listeners);