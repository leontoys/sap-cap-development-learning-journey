const cds = require('@sap/cds');

class EmployeeService extends cds.ApplicationService {

    async init() {
        const { Employee , Products } = this.entities;
        const service = await cds.connect.to('Northwind');


        // Validate the life data entered for an author
        this.before('UPDATE', Employee.drafts , async (req) => {
            let pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
            if (!pattern.test(req.data.email)) {
            //    req.reject({ code: '400', message: 'Invalid email', target: 'email' });
            }

            let salary = 0
            switch (req.data.designation_code) {
                case 'D001':
                    salary = 100
                    break;
                case 'D002':
                    salary = 200
                    break;                
                case 'D003':
                    salary = 300
                    break;                
                case 'D004':
                    salary = 400
                    break;                
                case 'D005':
                    salary = 500
                    break;                
                case 'D006':
                    salary = 600
                    break;                
                case 'D007':
                    salary = 700
                    break;            
                default:
                    break;
            }
            req.data.salary = salary

        });

        this.on('READ',Products,async(req)=>{
            return service.tx(req).run(req.query);
        })

        return super.init();
    }

}

module.exports = EmployeeService;