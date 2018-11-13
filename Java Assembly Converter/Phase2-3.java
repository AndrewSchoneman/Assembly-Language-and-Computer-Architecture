package edu.uiowa.cs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Phase2 {

    /* Returns a list of copies of the Instructions with the
     * immediate field of the instruction filled in
     * with the address calculated from the branch_label.
     *
     * The instruction should not be changed if it is not a branch instruction.
     *
     * unresolved: list of instructions without resolved addresses
     * first_pc: address where the first instruction will eventually be placed in memory
     */
    public static List<Instruction> resolve_addresses(List<Instruction> unresolved, int first_pc) {
        LinkedList<Instruction> addressesToFix = new LinkedList<>(); 
        boolean backwards = false; 
        boolean startCount = false; 
        for(Instruction toResolve : unresolved){
            if(toResolve.label_id > 0){
               
                addressesToFix.add(toResolve);
            }

        }
        for(Instruction greaterThanZero : addressesToFix){
           int count = 0; 
           
            for(Instruction toResolve: unresolved){
                if(toResolve.branch_label == 0 && toResolve.label_id == greaterThanZero.label_id){
                    backwards = true;  
                }
                if(toResolve.label_id == greaterThanZero.label_id || toResolve.branch_label == greaterThanZero.label_id){
                    startCount = true; 
                }
                if(backwards && startCount){
                    count--;
                }
                else if(!backwards && startCount){
                    count++; 
                }

                
                
                if(greaterThanZero.label_id == toResolve.branch_label){
                    toResolve.immediate = count; 
  
                    break; 

                }


            }
            
            
        }
        
        
        return unresolved;
    }

}
