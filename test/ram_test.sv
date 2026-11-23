# code for ram_test
  ...
//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_base_test from uvm_test;
class ram_base_test extends uvm_test;

   // Factory Registration
        `uvm_component_utils(ram_base_test)


    // Declare the ram_env handle
           ram_env env_h;
        //Declare a variable no_of agents of int data type & initialize it to 3
        int no_of_agents=3;
        //------------------------------------------
        // METHODS
        //------------------------------------------

        // Standard UVM Methods:
        extern function new(string name = "ram_base_test" , uvm_component parent);
        extern function void build_phase(uvm_phase phase);

 endclass
//-----------------  constructor new method  -------------------//
// Define Constructor new() function
function ram_base_test::new(string name = "ram_base_test" , uvm_component parent);
        super.new(name,parent);
endfunction

//-----------------  build() phase method  -------------------//

function void ram_base_test::build_phase(uvm_phase phase);

    // set the no_of_agents into UVM config DB  "int"
        uvm_config_db #(int)::set(this,"*","int",no_of_agents);
    super.build_phase(phase);
        // create the instance for env
        env_h=ram_env::type_id::create("env_h",this);
endfunction
...                               
