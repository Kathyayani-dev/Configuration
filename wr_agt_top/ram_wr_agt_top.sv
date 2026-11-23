# code for ram_wr_agt_top
  ...
  //------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

   // Extend ram_wr_agt_top from uvm_env;
        class ram_wr_agt_top extends uvm_env;

   // Factory Registration
        `uvm_component_utils(ram_wr_agt_top)
        // Declare a variable no_of_agents of int data type to get the configuration
        int no_of_agents;
   // Declare the dynamic array of agent handles
   ram_wr_agent agth[];
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
        extern function new(string name = "ram_wr_agt_top" , uvm_component parent);
        extern function void build_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
  endclass
//-----------------  constructor new method  -------------------//
   // Define Constructor new() function
        function ram_wr_agt_top::new(string name = "ram_wr_agt_top" , uvm_component parent);
                super.new(name,parent);
        endfunction


//-----------------  build() phase method  -------------------//
        function void ram_wr_agt_top::build_phase(uvm_phase phase);
                //Get the configuration from the config_db "int"
                if(!uvm_config_db #(int)::get(this,"","int",no_of_agents))
                        `uvm_fatal(get_type_name(),"failed to get")
                super.build_phase(phase);
                // Give the size for the agnth array as equal to no_of_agents
                agth=new[no_of_agents];
       // Create the instance of ram_wr_agent within foreach loop
 foreach(agth[i])
                agth[i]=ram_wr_agent::type_id::create($sformatf("agth[%0d]",i),this);

                //set first two agents as active & third agent as passive in to config data base "bit"

                for(int i=0;i<2;i++)
                uvm_config_db#(bit)::set(this,$sformatf("agth[%0d]",i),"bit",1);

                uvm_config_db#(bit)::set(this,"agth[2]","bit",0);

        endfunction


//-----------------  run() phase method  -------------------//
       // Print the topology
        task ram_wr_agt_top::run_phase(uvm_phase phase);
                uvm_top.print_topology;
        endtask
...
