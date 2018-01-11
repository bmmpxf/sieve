pragma solidity ^0.4.17;

import "truffle/Assert.sol";
//import "truffle/DeployedAddresses.sol";
import "../contracts/Sieve.sol";


contract TestSieve {

  function testsqrt10() public {

    Sieve sieve = new Sieve();
    uint expected = 3;
    Assert.equal(sieve.sqrt(10), expected, "No, actually sqrt(10) = 3. Why would you think otherwise?");

  }

  function testprimes17() public {

    Sieve sieve = new Sieve();
    uint expected = 7;
    Assert.equal(sieve.numPrimes(17), expected, "There are seven primes <= 17.");

  }

  function testalltheprimes17() public {

    Sieve sieve = new Sieve();
    uint[7] memory expected = [uint(2),uint(3),uint(5),uint(7),uint(11),uint(13),uint(17)];

    uint sieventeen = sieve.numPrimes(17);

    for (uint j=0; j < sieventeen; j++) {
      Assert.equal(sieve.primeAt(17,j), expected[j], "Numbers do not match.");
    }

  }

  // Make sure that primes(16) doesn't give you 17
  function testoffbyone16() public {

    Sieve sieve = new Sieve();
    uint notexpected = 17;
    uint siexteen = sieve.numPrimes(16);

    for (uint j=0; j < siexteen; j++) {
      Assert.notEqual(sieve.primeAt(16,j), notexpected, "Should not see 17 in there.");
    }

  }

  // Make sure that primes(18) gives you 17
  function testoffbyone18() public {

    Sieve sieve = new Sieve();
    uint expected = 17;
    uint found17;
    uint sieighteen = sieve.numPrimes(18);

    for (uint j=0; j < sieighteen; j++) {
      if (sieve.primeAt(18,j) == expected) {
        found17 = 1;
      }
    }
    Assert.equal(found17, 1, "Should see 17 in there.");

  }

}
