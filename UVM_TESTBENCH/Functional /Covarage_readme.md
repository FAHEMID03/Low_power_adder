**Mapping Coverage to Your Verification Plan
Test Case                      	Coverage Collected**
TC_01 Reset	                  Reset branches, reset toggles
TC_02 Basic Addition	        Register write, arithmetic path, valid output
TC_03 Zero Addition	          Zero bins, result zero bin
TC_04 Overflow	              Overflow coverpoint, max operand bins
TC_05 Random Values	          Operand ranges, cross coverage
TC_06 Start Pulse           	Start signal coverage, protocol branch
TC_07 Data Valid              Timing	Valid signal coverage
TC_08 Multiple Transactions	  Transaction repetition, cross coverage
TC_09 Back-to-Back Start	    Consecutive write and handshake coverage
TC_10 Idle Cycles	            Idle branch, no-operation path
