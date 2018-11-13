package edu.uiowa.cs;

import java.util.LinkedList;
import java.util.List;

public class Phase3 {

    /* Translate each Instruction object into
     * a 32-bit number.
     *
     * tals: list of Instructions to translate
     *
     * returns a list of instructions in their 32-bit binary representation
     *
     */
    public static List<Integer> translate_instructions(List<Instruction> tals) {
        LinkedList<Integer> toReturn = new LinkedList<>(); 
        int count = 0;
        int toAdd;
        for(Instruction mipsToBinary : tals){
            count++; 
            switch (mipsToBinary.instruction_id) {
                case 1:
                    // addiu
                    toAdd = 9 << 26;
                    toAdd |= mipsToBinary.rt << 21;
                    toAdd |= mipsToBinary.rs << 16;
                    toAdd |= mipsToBinary.immediate;
                    toReturn.add(toAdd);
                    break;
                case 2:
                    // addu
                    toAdd = mipsToBinary.rs << 21;
                    toAdd |= mipsToBinary.rt << 16;
                    toAdd |= mipsToBinary.rd << 11;
                    toAdd |= 33;
                    toReturn.add(toAdd);
                    break;
                case 3:
                    // or
                    toAdd = mipsToBinary.rs << 21;
                    toAdd |= mipsToBinary.rt << 16;
                    toAdd |= mipsToBinary.rd << 11;
                    toAdd |= 37;
                    break;
                case 5:
                    // beq
                    toAdd = 4 << 26;
                    toAdd |= mipsToBinary.rs << 21;
                    toAdd |= mipsToBinary.rt << 16;
                    toAdd |= mipsToBinary.immediate << 16 >>> 16;
                    toReturn.add(toAdd);
                    break;
                case 6:
                    // bne
                    toAdd = 5 << 26;
                    toAdd |= mipsToBinary.rs << 21;
                    toAdd |= mipsToBinary.rt << 16;
                    toAdd |= mipsToBinary.immediate << 16 >>> 16;
                    toReturn.add(toAdd);
                    break;
                case 8:
                    //slt
                    toAdd = mipsToBinary.rs << 21;
                    toAdd |= mipsToBinary.rt << 16;
                    toAdd |= mipsToBinary.rd << 11;
                    toAdd |= mipsToBinary.shift_amount << 6;
                    toAdd |= 42;
                    toReturn.add(toAdd);
                    break;
                case 9:
                    //lui
                    toAdd = 15 << 26;
                    toAdd |= mipsToBinary.rt << 16;
                    toAdd |= mipsToBinary.immediate;
                    toReturn.add(toAdd);
                    break;
                case 10:
                    //ori
                    toAdd = 13 << 26;
                    toAdd |= mipsToBinary.rs << 21;
                    toAdd |= mipsToBinary.rt << 16;
                    toAdd |= mipsToBinary.immediate;
                    toReturn.add(toAdd);
                    break;
                default:
                    // check against bad inputs
                    throw new IllegalArgumentException("This is either an unsupported or invalid MIPS instruction"); 
            }
        }
        return toReturn;
    }
}
