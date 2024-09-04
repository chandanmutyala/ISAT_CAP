const cds =require('@sap/cds');
module.exports=cds.service.impl(async function() {
    const {Customers}=cds.entities;
    this.on('CREATE','Customers',async(req)=>{
        try {
            const { custid, name, location, description } = req.data;
            const autoid = await this.run(SELECT.one.from(Customers).columns('max(autoid) as maxID'));
            const newID = (autoid.maxID || 0) + 1;
            const newCustomer = {
                autoid: newID,
                custid,
                name,
                location,
                description
            };
            return await this.run(INSERT.into(Customers).entries(newCustomer));
        } catch (error) {
            req.error(500, `Error creating customer: ${error.message}`);
        }
    }),
    this.on('UPDATE', 'Customers', async (req) => {
        try {
            const { autoid, custid, name, location, description } = req.data;
            return await this.run(UPDATE(Customers).set({ custid, name, location, description }).where({ autoid }));
        } catch (error) {
            req.error(500, `Error updating customer: ${error.message}`);
        }
    });
    this.on('DELETE', 'Customers', async (req) => {
        try {
            const { autoid } = req.data;
            return await this.run(DELETE.from(Customers).where({ autoid }));
        } catch (error) {
            req.error(500, `Error deleting customer: ${error.message}`);
        }
    });

   
    this.on('READ', 'Customers', async (req) => {
        try {
            return await this.run(SELECT.from(Customers));
        } catch (error) {
            req.error(500, `Error reading customers: ${error.message}`);
        }
    });

   
})