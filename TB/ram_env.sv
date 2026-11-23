# code for ram_env
  ...
      //------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_env from uvm_env
class ram_env extends uvm_env;

   // Factory Registration
        `uvm_component_utils(ram_env)

        // Declare the ram_wr_agt_top handle
        ram_wr_agt_top toph;
        //------------------------------------------
        // METHODS
        //------------------------------------------

        // Standard UVM Methods:
        extern function new(string name = "ram_env",uvm_component parent);
        extern function void build_phase(uvm_phase phase);
endclass

//-----------------  constructor new method  -------------------//
function ram_env::new(string name="ram_env",uvm_component parent);
        super.new(name,parent);
endfunction



 //-----------------  Add UVM build() phase   -------------------//
function void ram_env::build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Create the instance of ram_wr_agt_top in the build phase
        toph=ram_wr_agt_top::type_id::create("toph",this);
endfunction
...
