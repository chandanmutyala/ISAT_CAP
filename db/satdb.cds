namespace com.cy.isat;
//using { managed } from '@sap/cds/common';


//UUID instead of Integer
entity Customers {
    key autoid      : Integer;
        custid      : String(10);
        name        : String(20);
        location    : String(20);
        description : String(100);
}

entity Projects {
    key autoid      : Integer;
        projid      : String(10);
        name        : String(20);
        description : String(100);
        status      : Boolean;
}

entity Customers_Projects {
    key autoid : Integer;
        custid : Association to Customers;
        projid : Association to Projects;
}

entity Users {
    key autoid : Integer;
        userid : String(10);
        name   : String(20);
        role   : String(10);
        active : Boolean;
        emailid : String(20) @assert.valid.email;
        custid : String(10);
}

entity Roles {
    key autoid      : Integer;
        roleid      : String(10);
        name        : String(20);
        description : String(100);
        active      : Boolean;
}

entity Teams {
    key autoid      : Integer;
        teamid      : String(10);
        name        : String(20);
        description : String(100);
}

entity Teams_Users {
    key autoid : Integer;
        teamid : Association to Teams;
        userid : Association to Users;
        active : Boolean;
}

entity Users_Roles {
    key autoid : Integer;
        userid : Association to Users;
        roleid : Association to Roles;
}

entity Tasklist {
    key autoid      : Integer;
        name        : String(20);
        type        : String(10);
        description : String(100);
}


//here we can use managed aspect
entity Tasks {
    key autoid           : Integer;
        task_name        : String(20);
        duration         : String(20);
        startdate        : Date; 
        enddate          : Date;
        status           : String(10);
        type             : String(10);
        parent_task_id      : Integer;    //any specific relation --task list id 
        assigned_to      : String(20);
        created_by       : String(20);
        updated_datetime : DateTime;
        created_datetime : DateTime;
        tasklist_id      : Association to Tasklist;
}

entity TimeCapture {
    key autoid     : Integer;
        start_time : Time;
        end_time   : Time;
        task_id    : Association to Tasks;
}

entity Component {
    key autoid      : Integer;
        compid      : String(10);
        name        : String(20);
        description : String(100);
        type        : String(10);
}

// entity CompDetails {
//     key autoid : Integer;
//         compid : Association to Component;
//         module : String(20);
// }

entity Component_TaskList {
    key autoid      : Integer;
        compid      : Association to Component;
        tasklist_id : Association to Tasklist;
}

entity Comments {
    key autoid           : Integer;
        comment          : String(1000);
        refid            : String(10);
        type             : Date;
        created_by       : String(20);
        created_datetime : DateTime;
}

entity Timelines {
    key autoid         : Integer;
        start_datetime : Time;
        end_datetime   : Time;
        refid          : Integer;
        type           : String(10);
}


entity Phases {
    key autoid     : Integer;
        phase_name : String(20);
}


entity Component_Stages {
    key autoid : Integer;
        compid : Association to Component;
}


entity Stages {
    key autoid     : Integer;
    name : String(2);

}