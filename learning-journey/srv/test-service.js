const cds = require('@sap/cds')

class helloservice extends cds.ApplicationService{

    hello(name) {
        return 'hello world ' + name
    }

}

module.exports = helloservice