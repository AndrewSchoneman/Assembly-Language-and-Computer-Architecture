package edu.uiowa.cs;

import java.util.LinkedList;
import java.util.List;

public class Phase1 {

    /* Translates the MAL instruction to 1-3 TAL instructions
     * and returns the TAL instructions in a list
     *
     * mals: input program as a list of Instruction objects
     *
     * returns a list of TAL instructions (should be same size or longer than input list)
     */
    public static List<Instruction> mal_to_tal(List<Instruction> mals) {
        LinkedList toReturn = new LinkedList<>(); 
        for(Instruction toParse : mals){
            
            if(toParse.instruction_id == 1){
                if(toParse.immediate > 0xFFFF || toParse.immediate < -65536 ){
                    toReturn.add(new Instruction(9,0,0,1, toParse.immediate >>> 16,0,0,toParse.label_id, toParse.branch_label)); // conver to lui
                    toReturn.add(new Instruction(10,0,1,1, (toParse.immediate<<16) >>> 16,0,0,toParse.label_id, toParse.branch_label )); // convert to ori
                    toReturn.add( new Instruction(2,toParse.rt,toParse.rs,1,0,0,0,toParse.label_id, toParse.branch_label)); // convert to addu
                   
                 }
                 else{
                   toReturn.add(toParse);   
                 }
            }
            else if(toParse.instruction_id == 10 ){
                 //ori
                if(toParse.immediate > 0xFFFF || toParse.immediate < -65536){
                    toReturn.add(new Instruction(9,0,0,1, toParse.immediate >>> 16,0,0,toParse.label_id, toParse.branch_label )); // conver to lui
                    toReturn.add(new Instruction(10,0,0,1, (toParse.immediate<<16) >>> 16,0,0,toParse.label_id, toParse.branch_label )); // convert to ori
                    toReturn.add( new Instruction(2,toParse.rd,toParse.rs,1,0,0,0,toParse.label_id, toParse.branch_label)); // convert to addu
                }
                else{
                   toReturn.add(toParse);   
                }
            }
            else if(toParse.instruction_id == 100){
                /* 
                 blt  $s0,$t0,label1
                input.add(new Instruction(100,0,16,8,0,0,0,0,1));
                translation
                new Instruction(8, 1,16,8,0,0,0,0,0),  // slt $at,$s0,$t0
                new Instruction(6, 0,1,0,0,0,0,0,1),     // bne $at,$zero,label1
                */
                toReturn.add(new Instruction(8, 1, toParse.rs, toParse.rt ,0,0,0,0,0));
                toReturn.add(new Instruction(6,0,1, 0,0,0,0,0,toParse.branch_label)); 
                
            }
            else if(toParse.instruction_id == 101){
                
                // bgt - branch greater than
                
                toReturn.add(new Instruction(8, 1, toParse.rt, toParse.rs,0,0,0,0,0));
                toReturn.add(new Instruction(6,0,1, 0,0,0,0,0,toParse.branch_label)); 
                
            }

            else if(toParse.instruction_id != 10 || toParse.instruction_id != 100 || toParse.instruction_id != 101 || toParse.instruction_id != 1){
                toReturn.add(toParse); 
            }

        }
        return toReturn;
    }

}
