const cds = require('@sap/cds');

class EmployeeService extends cds.ApplicationService {

    init() {
        const { Employee } = this.entities;

        // Validate the life data entered for an author
        this.before('UPDATE', Employee.drafts , async (req) => {
            let pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
            if (!pattern.test(req.data.email)) {
                req.reject({ code: '400', message: 'Invalid email', target: 'email' });
            }
        });

        return super.init();
    }

}

module.exports = EmployeeService;