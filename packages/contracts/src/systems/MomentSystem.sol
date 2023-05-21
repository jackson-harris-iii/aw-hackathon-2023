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
  function createMoment(string memory location, string memory locationType, uint64 date, uint64 startTime, uint64 endTime, bool isLive, string memory title, string memory description, string memory nftMetadata) public {
    
    bytes32 id = getUniqueEntity();
    Moment.set(id, MomentData({
      location: location,
      locationType: locationType,
      date: date,
      startTime: startTime,
      endTime: endTime,
      isLive: isLive,
      owner: addressToEntity(_msgSender()),
      title: title,
      description: description,
      nftMetadata: nftMetadata
    }));
  }

  function toggleIsLive(bytes32 momentId) public{
    bytes32 sender = addressToEntity(_msgSender());
    
    require(sender == Moment.getOwner(momentId), "Only the owner of the moment can toggle the isLive flag");

    Moment.setIsLive(momentId, !Moment.getIsLive(momentId));
  }
}
