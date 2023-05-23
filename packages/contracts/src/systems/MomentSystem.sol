// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { addressToEntity } from "../Utils.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";

import { 
  Moment,
  MomentData
} from "../codegen/Tables.sol";

contract MomentSystem is System {
  function createMoment( uint64 date, uint64 startTime, uint64 endTime, bool isLive, string memory owner, string memory location, string memory title, string memory description, string memory nftMetadata) public returns (bool) {
    
    bytes32 id = getUniqueEntity();
    Moment.set(id, MomentData({
      date: date,
      startTime: startTime,
      endTime: endTime,
      isLive: isLive,
      owner: owner,
      location: location,
      // locationType: locationType,
      title: title,
      description: description,
      nftMetadata: nftMetadata
    }));
    return true;
  }

  function toggleIsLive(bytes32 momentId) public returns (bool){
    // bytes32 sender = addressToEntity(_msgSender());
    
    // require(sender == Moment.getOwner(momentId), "Only the owner of the moment can toggle the isLive flag");
    // require(Moment.getOwner(momentId) == owner, "Only the owner of the moment can toggle the isLive flag");

    Moment.setIsLive(momentId, !Moment.getIsLive(momentId));
    return true;
  }
}
