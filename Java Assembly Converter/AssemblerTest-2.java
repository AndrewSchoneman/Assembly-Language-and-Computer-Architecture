package edu.uiowa.cs;

import org.junit.Test;

import java.util.LinkedList;
import java.util.List;

import static org.junit.Assert.*;

public class AssemblerTest {
        private static int MARS_TEXT_SEGMENT_START = 0x00400000;

        private static void testHelper(List<Instruction> input, Instruction[] expectedP1, Instruction[] expectedP2, Integer[] expectedP3) {
            // Phase 1
            List<Instruction> tals = Phase1.mal_to_tal(input);
            assertArrayEquals(expectedP1, tals.toArray());

            
            
            // Phase 2
            List<Instruction> resolved_tals = Phase2.resolve_addresses(tals, MARS_TEXT_SEGMENT_START);
            assertArrayEquals(expectedP2, resolved_tals.toArray());

            // Phase 3
            List<Integer> translated = Phase3.translate_instructions(resolved_tals);
            assertArrayEquals(expectedP3, translated.toArray());
        }

        @Test
        public void test1() {
            // test 1
            List<Instruction> input = new LinkedList<Instruction>();
            // label1: addu $t0, $zero, $zero
            input.add(new Instruction(2, 8, 0, 0, 0, 0, 0, 1, 0));
            // addu $s0, $s7, $t4
            input.add(new Instruction(2,16,23,12,0,0,0,0,0));
            // blt  $s0,$t0,label1
            input.add(new Instruction(100,0,16,8,0,0,0,0,1));
            // addiu $s1,$s2,0xF00000
            input.add(new Instruction(1, 0, 18, 17, 0xF00000, 0, 0, 0, 0));

            // Phase 1
            Instruction[] phase1_expected = {
                    new Instruction(2,8,0,0,0,0,0,1,0), // label1: addu $t0, $zero, $zero
                    new Instruction(2, 16, 23,12,0,0,0,0,0), // addu $s0, $s7, $t4
                    new Instruction(8, 1,16,8,0,0,0,0,0),  // slt $at,$s0,$t0
                    new Instruction(6, 0,1,0,0,0,0,0,1),     // bne $at,$zero,label1
                    new Instruction(9, 0,0,1,0x00F0,0,0,0,0), // lui $at, 0x00F0
                    new Instruction(10,0,1,1,0x0000,0,0,0,0), // ori $at, $at 0x0000
                    new Instruction(2,17,18,1,0,0,0,0,0) // addu $s1,$s2,$at
            };
            
            


            // Phase 2
            Instruction[] phase2_expected = {
                    new Instruction(2,8,0,0,0,0,0,1,0),
                    new Instruction(2,16,23,12,0,0,0,0,0),
                    new Instruction(8,1,16,8,0,0,0,0,0),
                    new Instruction(6,0,1,0,0xfffffffc,0,0,0,1),
                    new Instruction(9,0,0,1,0x00F0,0,0,0,0),
                    new Instruction(10,0,1,1,0x0000,0,0,0,0),
                    new Instruction(2,17,18,1,0,0,0,0,0)
            };


            // Phase 3
            Integer[] phase3_expected = {
                    // HINT: to get these, type the input program into MARS, assemble, and copy the binary values into your test case
                    0x00004021, // 0000 0000 0000 0000 0000 0000 0100 0000 0010 0001
                                //                                100 0000 0010 0001 
                    0x02ec8021, // 0000 0000 0000 0010 1110 1100 1000 0000 0010 0001
                                //                  10 1110 1100 1000 0000 0010 0001
                    0x0208082a, // 0000 0000 0000 0010 0000 1000 0000 1000 0010 1010
                    
                    0x1420fffc, // 0000 0000 0001 0100 0010 0000 1111 1111 1111 1100
                                //              1 0000 0010 0000 1111 1111 1111 1100
                                //              1 0100 0010 0000 0000 0000 0000 0000

                    0x3c0100f0, // 0000 0000 0011 1100 0000 0001 0000 0000 1111 0000
                                //             11 1100 0000 0001 0000 0000 1111 0000
                    0x34210000, // 0000 0000 0011 0100 0010 0001 0000 0000 0000 0000
                                //             11 0100 0001 0001 0000 0000 0000 0000
                    0x02418821  // 0000 0000 0000 0010 0100 0001 1000 1000 0010 0001
                                //                 11011000110010000000000000 1100
            };


            testHelper(input,
                    phase1_expected,
                    phase2_expected,
                    phase3_expected);
        }

        @Test
        public void test2() {
            // test 1
            List<Instruction> input = new LinkedList<Instruction>();
            //  addiu $t0, $zero, 4
            input.add(new Instruction(1, 0, 8, 0, 4, 0, 0, 0, 0));
            // label1: addiu $s0, $s7, 8
            input.add(new Instruction(1,0,16,23,8,0,0,1,0));
            // blt  $s0,$t0,label1
            input.add(new Instruction(101,0,16,8,0,0,0,0,1));
            // ori $s1,$s2,0xC
            input.add(new Instruction(10, 0, 18, 17, 0xC, 0, 0, 0, 0));
            
            
            Instruction[] phase1_expected = {
                    new Instruction(1,0,8,0,4,0,0,0,0), // label1: addu $t0, $zero, $zero
                    new Instruction(1, 0, 16,23,8,0,0,1,0), // addu $s0, $s7, $t4
                    new Instruction(8, 1,8,16,0,0,0,0,0),  // slt $at,$s0,$t0
                    new Instruction(6, 0,1,0,0,0,0,0,1),     // bne $at,$zero,label1

                    new Instruction(10,0,18,17,0xC,0,0,0,0) // addu $s1,$s2,$at
            };
            
            
            Instruction[] phase2_expected = {
                    new Instruction(1,0,8,0,4,0,0,0,0), // label1: addu $t0, $zero, $zero
                    new Instruction(1, 0, 16,23,8,0,0,1,0), // addu $s0, $s7, $t4
                    new Instruction(8, 1,8,16,0,0,0,0,0),
                    new Instruction(6,0,1,0,0xfffffffd,0,0,0,1),
                    new Instruction(10,0,18,17,0xC,0,0,0,0) // addu $s1,$s2,$at
            };            
            Integer[] phase3_expected = {
                    // HINT: to get these, type the input program into MARS, assemble, and copy the binary values into your test case
                    0x24080004, //           0010 0100 0000 1000 0000 0000 0000 0100
                                //             10 0100 0000 1000 0000 0000 0000 0000
                    0x26f00008, // 0000 0000 0000 0010 1110 1100 1000 0000 0010 0001
                                //                  10 1110 1100 1000 0000 0010 0001
                    0x0110082a, // 0000 0000 0000 0010 0000 1000 0000 1000 0010 1010
                    
                    0x1420fffd, // 0000 0000 0001 0100 0010 0000 1111 1111 1111 1100
                                //              1 0000 0010 0000 1111 1111 1111 1100
                                //              1 0100 0010 0000 0000 0000 0000 0000


                    0x3651000c  // 0000 0000 0011 0110 0101 0001 0000 0000 0000 1100
                                //             11 0110 0011 0010 0000 0000 0000 1100
            };

            
            
             testHelper(input,
                    phase1_expected,
                    phase2_expected,
                    phase3_expected);

        }
        
        private static void testHelper2(List<Instruction> input, Instruction[] expectedP1, Instruction[] expectedP2, Integer[] expectedP3) {
            // Phase 1
            List<Instruction> tals = Phase1.mal_to_tal(input);
            assertArrayEquals(expectedP1, tals.toArray());
  
          
            
            
            // Phase 2
            List<Instruction> resolved_tals = Phase2.resolve_addresses(tals, MARS_TEXT_SEGMENT_START);
            assertArrayEquals(expectedP2, resolved_tals.toArray());

            // Phase 3
            List<Integer> translated = Phase3.translate_instructions(resolved_tals);
            assertArrayEquals(expectedP3, translated.toArray());

           
        }      
         @Test
        public void test3() {
            // test 1
            List<Instruction> input = new LinkedList<Instruction>();
            //  $s1, $a1, label1
            input.add(new Instruction(5, 0, 17, 5, 0, 0, 0, 0, 1));
            // addiu $s1, $s1, 4
            input.add(new Instruction(1,0,17,17,4,0,0,0,0));
            // label1: addiu $s2, $s0, 3

            input.add(new Instruction(1,0,18,16,3,0,0,1,0));

            
            
            Instruction[] phase1_expected = {
                    new Instruction(5, 0, 17, 5, 0, 0, 0, 0, 1), // label1: addu $t0, $zero, $zero
                    new Instruction(1,0,17,17,4,0,0,0,0), // addu $s0, $s7, $t4
                    new Instruction(1,0,18,16,3,0,0,1,0),  // slt $at,$s0,$t0

            };
            
            
            Instruction[] phase2_expected = {
                    new Instruction(5, 0, 17, 5, 1, 0, 0, 0, 1), // label1: addu $t0, $zero, $zero
                    new Instruction(1,0,17,17,4,0,0,0,0), // addu $s0, $s7, $t4
                    new Instruction(1,0,18,16,3,0,0,1,0),

            };            
            Integer[] phase3_expected = {
                0x12250001, // 0000 0000 0001 0010 0010 0101 0000 0000 0000 0001
                            //              1 0010 0010 0101 0000 0000 0000 0001


                0x26310004,
                0x26120003  // 0000 0000 0010 0110 0001 0010 0000 0000 0000 0011
                            // 100110000100100000000000000000

            };

            
            
             testHelper(input,
                    phase1_expected,
                    phase2_expected,
                    phase3_expected);

        }
        
        private static void testHelper3(List<Instruction> input, Instruction[] expectedP1, Instruction[] expectedP2, Integer[] expectedP3) {
            // Phase 1
            List<Instruction> tals = Phase1.mal_to_tal(input);
            assertArrayEquals(expectedP1, tals.toArray());
  
          
            
            
            // Phase 2
            List<Instruction> resolved_tals = Phase2.resolve_addresses(tals, MARS_TEXT_SEGMENT_START);
            assertArrayEquals(expectedP2, resolved_tals.toArray());

            // Phase 3
            List<Integer> translated = Phase3.translate_instructions(resolved_tals);
            assertArrayEquals(expectedP3, translated.toArray());

           
        }        
}