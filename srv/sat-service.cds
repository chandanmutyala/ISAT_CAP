using com.cy.isat as isat from '../db/satdb';
service satSRV{
    entity Customers as projection on isat.Customers;
}