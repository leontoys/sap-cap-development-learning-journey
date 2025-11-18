const cds = require('@sap/cds')

class helloservice extends cds.ApplicationService{

    hello() {
        return 'hello world'
    }

}

module.exports = helloservice