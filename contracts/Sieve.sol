pragma solidity ^0.4.17;

contract Sieve {

  function primes(uint a) public pure returns (uint[] plist) {

    // Generate array from 2 to a
    uint[] memory allNums = new uint[](a-1);
    for (uint j=0; j < a-1 ; j++) {
      allNums[j] = j+2;
    }

    // Generate array which will house which numbers to kill
    // Will be filled with 0s to start; 1s will denote kills
    uint[] memory isNotPrime = new uint[](a-1);

    // This will house the primes when done
    uint[] memory q = new uint[](a-1);

    // Counting the number of primes
    uint numPrimes = 0;

    // Find where we stop counting
    uint sqrt_a = sqrt(a);
    
    // Total entries in the array
    // Should be a-1
    uint c = allNums.length;

    // Start at first index
    j = 0;

    // The number we're sieving
    uint i = allNums[j];

    // k is index of the values 2, 4, 6, 8, 10 to be removed given sieve i=2
    // k starts with 0
    uint k = j;


    // The main sieve loop

    // while the number we're sieving is less than 
    // the sqrt of the input number...
    while (i <= sqrt_a) {

      // TODO: ADD CHECK FOR SQRT
      
        // k is index of the values to be removed given sieve
        // k starts with 0 (but it skips to k+i)
        k = j;
        // while we haven't gone past the end of the array
        while (k + i < c) {    
          // Ex: 0 -> 2, 2 -> 4, etc
          k = k + i;
          // if sieve number is 2, eliminate 4, then 6,
          isNotPrime[k] = 1;
        }

    // Once we've made it to the end of the array
    // Move to the next number in the list (Ex. 2 -> 3)
    j = j+1;
    i = allNums[j];

    // Now we can reevaluate the while (i <= b) condition

    }

    // Now we have allNums =  (2,3,4,5,6,7...)
    //             isNotPrime = (0,0,1,0,1,0...)
    //Time to create an array (2,3,5,7...)
    for (j=0; j < a-1; j++) {
      if (isNotPrime[j] == 0) {
        q[numPrimes] = allNums[j];
        numPrimes++;  
      }
    }

    plist = new uint[](numPrimes);
    
    //DEBUG
    for (j=0; j < numPrimes; j++) {
      plist[j] = q[j];
    }



  }


  function sqrt(uint x) public pure returns (uint y) {
    uint z = (x + 1) / 2;
    y = x;
    while (z < y) {
      y = z;
      z = (x / z + z) / 2;
    }
  }


}