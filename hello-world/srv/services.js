const cds = require('@sap/cds')
class BooksService extends cds.ApplicationService{
  init(){
    const {Books} = this.entities

    this.on('READ',Books, (req,next) => {
      console.log("reached here")
      return next() //you need to add return
    })

    return super.init()
  }
}

module.exports = BooksService
