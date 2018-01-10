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

}
