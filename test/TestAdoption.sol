pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // the address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());
    // the id of the pet that will be used for testing
    uint256 expectedPetId = 0;
    // expected owner of the adopted pet
    address expectedAdopter = address(this);

    // testing adopt function
function testUserCanAdoptPet() public {
    uint256 returnedId = adoption.adopt(expectedPetId);
    Assert.equal(
        returnedId,
        expectedPetId,
        "Adoption of expected pet should match returneId."
    );
}

// Testing for single pet owner
function testGetAdopterAddressBypetId() public {
    address adopter = adoption.adopters(expectedPetId);

    Assert.equal(
        adopter,
        expectedAdopter,
        "Owner of the expected pet should be this contract"
    );
}

// Testing retrieval of all pet owners
function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(
        adopters[expectedPetId],
        expectedAdopter,
        "Owner of the expected pet should be this contract"
    );
}

}

