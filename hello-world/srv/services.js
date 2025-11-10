const cds = require('@sap/cds')

//add logger 
const logger = cds.log('cap-logger')
//add this.after

class BooksService extends cds.ApplicationService{
  init(){
    const {Books} = this.entities

//    this.on('READ',Books, (req,next) => {
//      console.log("reached here")
//      return next() //you need to add return
//    })

  logger('after reading')

  const changeUrgencyDueToSubject = (data) => {
    const books = Array.isArray(data) ? data : [data]
    books.forEach(book => {
      if (book.title.toLowerCase().includes('art')) {
        book.urgency = 'high'
      }
    })
  }

  this.after('READ',Books,(data,req)=>{
    logger(data)
    //return data.map(book => book.title += '--!--')
    changeUrgencyDueToSubject(data)
  })

  this.after('each',Books,(data,req)=>{
    logger(data)
  })

    return super.init()
  }
}

module.exports = BooksService
