const cds = require('@sap/cds');

class MyService extends cds.ApplicationService {
    sayHello(name) { return "Hello " + name; }
}

module.exports = MyService;