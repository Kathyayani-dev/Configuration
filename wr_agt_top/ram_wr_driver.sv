# code for ram_wr_driver
  ...
  //------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_wr_driver from uvm driver parameterized by write_xtn
class ram_wr_driver extends uvm_driver #(write_xtn);

   // Factory Registration

        `uvm_component_utils(ram_wr_driver)


        //------------------------------------------
        // METHODS
        //------------------------------------------

        // Standard UVM Methods:

        extern function new(string name ="ram_wr_driver",uvm_component parent);
        extern task run_phase(uvm_phase phase);

endclass

//-----------------  constructor new method  -------------------//
// Define Constructor new() function
function ram_wr_driver::new(string name ="ram_wr_driver",uvm_component parent);
        super.new(name,parent);
endfunction


//-----------------  run() phase method  -------------------//


task ram_wr_driver::run_phase(uvm_phase phase);
   `uvm_info(get_type_name(), "This is Driver run phase", UVM_MEDIUM)
endtask
...
